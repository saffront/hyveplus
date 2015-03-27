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
      redirect_to @user 
    else
      render :new
    end
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :first_name, :last_name, :avatar, :password, :password_confirmation)
  end
end
