class My::AccountsController < My::BaseController
  before_action :set_user
  before_action :set_hyves

  def show
  end

  def update_profile
    update(profile_params, "profile")
  end

  def update_password
    update(password_params, "password")
  end

  private

  def set_user
    @user = current_user
  end

  def set_hyves
    @hyves = current_user.hyves
  end

  def update(parameters, text)
    if @user.update(parameters)
      redirect_to my_account_path, notice: "Your #{text} was successfully updated."
    else
      flash[:error] = @user.errors.full_messages
      redirect_to my_account_path
      #render :show
    end
  end

  def profile_params
    params.require(:user).permit(:email, :first_name, :last_name, :avatar, :username, :subscription)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
