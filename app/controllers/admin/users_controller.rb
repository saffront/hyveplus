class Admin::UsersController < Admin::AdminsController
  before_action :set_user, except: [:index]

  def index
    @users = User.all.order(:id)
    authorize @users
  end
  
  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "#{@user.email} successfully deleted from the database."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :first_name, :last_name, :avatar, :password, :password_confirmation, :role)
  end
end
