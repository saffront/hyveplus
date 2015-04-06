class My::AccountsController < My::BaseController
  before_action :set_user
  before_action :set_hyves, only: [:show]

  def show
  end

  def edit_profile
  end

  def edit_password
  end

  def update_profile
    update(profile_params, "profile", "edit_profile")
  end

  def update_password
    update(password_params, "password", "edit_password")
  end

  def subscribe
    newsletter(true, "SUBSCRIBED")
  end

  def unsubscribe
    newsletter(false, "UNSUBSCRIBED")
  end

  #def destroy
    #@user.destroy
    #redirect_to root_url
  #end

  private

  def set_user
    @user = current_user
  end

  def set_hyves
    @hyves = @user.hyves
  end

  def update(parameters, text, page)
    if @user.update(parameters)
      redirect_to my_account_path, notice: "Your #{text} was successfully updated."
    else
      render page.to_sym 
    end
  end

  def newsletter(boolean, action)
    @user.update(subscription: boolean)
    redirect_to my_account_path, notice: "You have successfully #{action} to our monthly user newsletter!"
  end

  def profile_params
    params.require(:user).permit(:email, :first_name, :last_name, :avatar, :username)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
