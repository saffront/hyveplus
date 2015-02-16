class UserSessionsController < ApplicationController
  #skip_before_action :require_login, only: [:index, :new, :create]
  before_action :require_login, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:user_sessions][:email], params[:user_sessions][:password])
      redirect_back_or_to(:users, notice: "Login successful")
    else
      redirect_to :back, alert: "Login failed"
    end
  end

  def destroy
    logout
    redirect_to :users, notice: "Logged out"
  end
end
