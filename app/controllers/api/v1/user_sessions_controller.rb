class Api::V1::UserSessionsController < Api::ApiController
  skip_before_action :authenticate_token

  def create
    case user_params[:provider]
    when "email"
      @user = login(user_params[:email], user_params[:password])
      find_user(@user)
    when "google", "facebook"
      @user = User.find_by(email: user_params[:email]) 
      find_user(@user)
    else
      @nil_params = NilParams.new 
      render json: @nil_params
    end
  end
  
  def register
    @user = User.new do |user|
      user.email = user_params[:email]
      user.password = user_params[:password]
      user.password_confirmation = user_params[:password_confirmation]
      user.username = user_params[:username]
      user.remote_avatar_url = user_params[:avatar]
      user.first_name = user_params[:first_name]
      user.last_name = user_params[:last_name]
    end
    set_authentication(@user)

    if @user.save
      set_password_and_send_email(@user) if user_params[:provider] == "facebook"
      @user.generate_api_token!
      render json: { user_session: UserSerializer.new(@user), api_token: @user.api_token }
    else
      render json: { errors: @user.errors }
    end
  end

  private

  def user_params
    params.require(:user_session).permit(:email, :password, :password_confirmation, :username, :avatar, :first_name, :last_name, :token, :api_token, :uid, :provider)
  end
  
  def find_user(user)
    @auth = user.try(:authentications).try(:find_by_provider, user_params[:provider])
    if user && @auth
      @auth.update(token: user_params[:token])
      user.generate_api_token!
      render json: { user_session: UserSerializer.new(user), api_token: user.api_token }
    else
      @nil_user = NilUser.new 
      render json: @nil_user
    end
  end

  def set_authentication(user)
    @authentication = user.authentications.new do |auth|
      auth.token = user_params[:token]
      set_provider(auth)
      set_uid(auth)
    end
  end

  def set_provider(auth)
    if user_params[:provider].nil?
      auth.provider = "email" 
    else
      auth.provider = user_params[:provider]
    end
  end

  def set_uid(auth)
    if user_params[:uid].nil?
      begin
        #Addition because SecureRandom may output 0
        auth[:uid] = ( (SecureRandom.random_number)*1234567890 + 1234567890 ).to_i 
      end while Authentication.exists?(uid: auth[:uid])
    else
      auth.uid = user_params[:uid]
    end
  end
end

  def set_password_and_send_email(user)
    password = SecureRandom.hex
    @user.update(password: password, password_confirmation: password)
    PasswordEmailJob.new.async.perform(user, password)
  end

class NilParams
  attr_accessor :error

  def initialize
    @error = "Parameters missing or invalid."
  end
end

class NilUser
  attr_accessor :error

  def initialize
    @error = "User not found, please check your parameters."
  end
end
