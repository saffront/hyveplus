class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @auth = @user.authentications.new

    begin
      @auth[:uid] = ( (SecureRandom.random_number)*1234567890 + 1234567890 ).to_i 
    end while Authentication.exists?(uid: @auth[:uid])
    @auth[:provider] =  "email"
    if @user.save
      auto_login(@user)
      flash[:notice] = "Please activate your account to login in the future."
      redirect_to @user 
    else
      render :new
    end
  end

  def show
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, notice: 'User was succesfully activated!')
    else
      not_authenticated #by default redirects to root path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :first_name, :last_name, :avatar, :password, :password_confirmation)
  end
end
