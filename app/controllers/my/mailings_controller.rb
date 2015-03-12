class My::MailingsController < My::BaseController 
  before_action :set_user

  def sub
    mailchimp("subscribe", true)
  end

  def unsub
    mailchimp("unsubscribe", false)
  end

  private

  def set_user
    @user = current_user
  end

  def mailchimp(action, boolean)
    @action = action + "d"
    begin
      response = Mailings::MailChimpService.new(params[:email]).send(action)
      @user.update(subscription: boolean)
      flash[:success] = "#{params[:email]} #{@action} successfully"
    rescue Gibbon::MailChimpError => e
      flash[:error] = e.message
    end
    redirect_to :back
  end
end
