class My::AccountsController < My::BaseController
  before_action :set_user, :set_hyves
  before_action :set_hyve, only: [:update_hyve]

  def show
  end

  def update_profile
    update(@user, profile_params, "profile")
  end

  def update_password
    update(@user, password_params, "password")
  end

  def update_hyve
    update(@hyve, hyve_params, "hyve")
  end

  private

  def set_user
    @user = current_user
  end

  def set_hyves
    @hyves = current_user.hyves
  end

  def set_hyve
    #I don't like this
    @hyve = Hyve.find_by_uuid(params[:format])
  end

  def update(object, parameters, text)
    if object.update(parameters)
      redirect_to my_account_path, notice: "Your #{text} was successfully updated."
    else
      flash[:error] = object.errors.full_messages
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

  def hyve_params
    params.require(:hyve).permit(:name, :uuid, :distance, :image)
  end
end
