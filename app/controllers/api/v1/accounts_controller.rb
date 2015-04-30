class Api::V1::AccountsController < Api::ApiController
  def show
    render json: @user, serializer: UserSerializer
  end

  def update
    @user.remote_avatar_url = user_params[:avatar] if present?
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :first_name, :last_name, :avatar, :password, :password_confirmation)
  end

end
