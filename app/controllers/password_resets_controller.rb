class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def create
    @user = User.find_by_email(params[:email])
    @user.deliver_reset_password_instructions! if @user
    redirect_to root_path, notice: 'Instructions to reset your password has been sent to your email.'

  end

  def edit
    reset_password
  end

  def update
    reset_password 
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password!(params[:user][:password])
      redirect_to root_path, notice: "Password was succesfully updated."
    else
      render action: "edit"
    end
  end

  private

  def reset_password
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    binding.pry
    if @user.blank?
      not_authenticated
      return
    end
  end
end
