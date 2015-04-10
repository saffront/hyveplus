class UsersController < ApplicationController
  skip_before_action :require_login

  def create
    @user = User.new(user_params)
    @user[:username] = (user_params[:first_name] + " " + user_params[:last_name]).parameterize
    @auth = @user.authentications.new(provider: "email")
    generate_random_uid

    if @user.save
      EmailJob.new.async.perform(@user)
      auto_login(@user)
      redirect_to my_account_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :first_name, :last_name, :avatar, :password, :password_confirmation)
  end

  def generate_random_uid
    begin
      @auth[:uid] = ( (SecureRandom.random_number)*1234567890 + 1234567890 ).to_i 
    end while Authentication.exists?(uid: @auth[:uid])
  end
end
