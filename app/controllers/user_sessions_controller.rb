class UserSessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:user_sessions][:email], params[:user_sessions][:password])
      redirect_back_or_to(my_account_path, notice: "Login successful")
    else
      redirect_to :back, alert: "Login failed. Please input correct email or password."
    end
  end

  def destroy
    logout
    flash[:notice] = "Logged out"
    redirect_to root_path
  end
end
