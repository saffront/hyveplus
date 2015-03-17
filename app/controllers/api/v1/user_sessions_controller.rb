class Api::V1::UserSessionsController < Api::ApiController
  skip_before_action :authenticate_token

  def create
    @user = User.find_by_email(info_params[:email])

    if @user
      @user.generate_api_token!
      render json: { user_session: UserSerializer.new(@user), api_token: @user.api_token }
    else
      @user = User.new do |user|
        user.email = info_params[:email]
        @password = SecureRandom.urlsafe_base64(15)
        user.password = @password 
        user.password_confirmation = @password 
        user.username = info_params[:username]
        user.avatar = info_params[:avatar]
        user.first_name = info_params[:first_name]
        user.last_name = info_params[:last_name]
        user.role = 'user'

        #Authentication
        @authentication = user.authentications.new do |auth|
          if info_params[:provider].nil?
            auth.provider = "email" 
          else
            auth.provider = info_params[:provider]
          end
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
      if @user.save
        @user.generate_api_token!
        render json: { user_session: UserSerializer.new(@user), api_token: @user.api_token }
      else
        render json: { errors: @user.errors }
      end
    end
  end

  private

  def info_params
    params.require(:user_session).permit(:email, :password, :password_confirmation, :username, :avatar, :first_name, :last_name, :role, :api_token, authentication_attributes: [:uid, :provider] )
  end
end
