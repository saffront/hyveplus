class My::AccountsController < My::BaseController
  before_action :set_user

  def show
  end

  def edit_profile
  end

  def edit_password
  end

  def update_profile
    update(user_params, "profile", "edit_profile")
  end

  def update_password
    update(password_params, "password", "edit_password")
  end

  #def destroy
    #@user.destroy
    #redirect_to root_url
  #end

  private

  def set_user
    @user = current_user
  end

  def update(parameters, text, page)
    if @user.update(parameters)
      redirect_to my_account_path, notice: "Your #{text} was successfully updated."
    else
      render page.to_sym 
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar, :username)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
