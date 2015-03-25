class MailingsController < ApplicationController
  before_action :set_user
  skip_before_action :require_login

  def sub
    mailchimp("subscribe", true)
  end

  def unsub
    mailchimp("unsubscribe", false)
  end

  private

  def set_user
    #Only set user if subscribing/unsubscribing from my/account
    @user = current_user if current_user
  end

  def mailchimp(action, boolean)
    @action = action + "d"
    begin
      response = Mailings::MailChimpService.new(params[:email]).send(action)
      @user.update(subscription: boolean) if @user
      flash[:success] = "#{params[:email]} #{@action} successfully"
    rescue Gibbon::MailChimpError => e
      flash[:error] = e.message
    end
    redirect_to :back
  end
end
