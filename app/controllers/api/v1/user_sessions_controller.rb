class Api::V1::UserSessionsController < Api::ApiController
  skip_before_action :authenticate_token

  def create
    if info_params[:provider] == "email"
      #Logging in with email
      @user = login(info_params[:email], info_params[:password])
      find_user(@user)
    else
      #Logging in with external providers
      @user = User.find_by(email: info_params[:email]) 
      @auth = @user.try(:authentications).try(:find_by_uid, info_params[:uid]) #returns nil rather than raising an exception
      find_user(@user, @auth)
    end
  end

  private

  def info_params
    params.require(:user_session).permit(:email, :password, :password_confirmation, :username, :avatar, :first_name, :last_name, :api_token, :uid, :provider)
  end
  
  def find_user(user, *auth)
    if user && auth
      user.generate_api_token!
      render json: { user_session: UserSerializer.new(user), api_token: user.api_token }
    else
      register_new_user
    end
  end

  def register_new_user
    @user = User.new do |user|
      user.email = info_params[:email]
      user.password = info_params[:password]
      user.password_confirmation = info_params[:password_confirmation]
      user.username = info_params[:username]
      user.avatar = info_params[:avatar]
      user.first_name = info_params[:first_name]
      user.last_name = info_params[:last_name]
      user.role = 'user'
      set_authentication(user)
    end

    if @user.save
      @user.generate_api_token!
      render json: { user_session: UserSerializer.new(@user), api_token: @user.api_token }
    else
      render json: { errors: @user.errors }
    end
  end

  def set_authentication(user)
    @authentication = user.authentications.new do |auth|
      set_provider(auth)
      set_uid(auth)
    end
  end

  def set_provider(auth)
    if info_params[:provider].nil?
      auth.provider = "email" 
    else
      auth.provider = info_params[:provider]
    end
  end

  def set_uid(auth)
    if info_params[:uid].nil?
      begin
        #Addition because SecureRandom may output 0
        auth[:uid] = ( (SecureRandom.random_number)*1234567890 + 1234567890 ).to_i 
      end while Authentication.exists?(uid: auth[:uid])
    else
      auth.uid = info_params[:uid]
    end
  end
end
