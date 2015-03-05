class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :edit_password]
  skip_before_action :require_login, except: [:destroy]

  def index
    @users = User.all
    respond_to :html, :json
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  #def update
    #respond_to do |format|
      #if @user.update(user_params)
        #format.html { redirect_to @user }
        #format.json { render :show, status: :ok, location: @user }
      #else
        #format.html { render :edit }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      #end
    #end
  #end

  #def destroy
    #@user.destroy
    #respond_to do |format|
      #format.html { redirect_to users_url }
      #format.json { head :no_content }
    #end
  #end

  #def edit_password
  #end

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
