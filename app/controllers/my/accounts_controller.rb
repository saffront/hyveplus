class My::AccountsController < My::BaseController
  before_action :set_user, :set_hyves
  before_action :set_action, only: [:update_profile]

  def show
  end

  def update_profile
    @initial_subscription = @user.subscription

    # Calls Mailchimp API only if subscription status changes
    if @initial_subscription != @updated_subscription
      create_nice_sentence(@action)
      begin
        response = Mailings::MailChimpService.new(@email).send(@action)
        @user.update(subscription: @updated_subscription) if @user
        flash[:success] = "#{@email} #{@combine} newsletter successfully"
      rescue Gibbon::MailChimpError => e
        flash[:error] = e.message
      end
    end
 
    update(@user, profile_params, "profile")
  end

  def update_password
    update(@user, password_params, "password")
  end

  private

  def set_user
    @user = current_user
  end

  def set_hyves
    @hyves = current_user.hyves
  end

  #def set_hyve
    ## Friendly ID implementation
    #@hyve = Hyve.find_by(uuid: params[:uuid])
  #end

  def set_action
    @email = params.fetch(:user)[:email]
    if params.fetch(:user)[:subscription] == "1"
      @action = "subscribed_to_users"
      @updated_subscription = true
    else
      @action = "unsubscribed_from_users"
      @updated_subscription = false
    end
  end

  def create_nice_sentence(action)
    @split = action.gsub(/_/, " ").split
    @uppercase = @split.drop(2).collect { |s| s.capitalize }
    @combine = @split[0] + " " + @split[1] + " " + @uppercase.join
  end

  def update(object, parameters, text)
    if object.update(parameters)
      redirect_to my_account_path, notice: "Your #{text} was successfully updated."
    else
      flash[:error] = object.errors.full_messages
      redirect_to my_account_path
    end
  end

  def profile_params
    params.require(:user).permit(:email, :first_name, :last_name, :avatar, :username, :subscription)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
