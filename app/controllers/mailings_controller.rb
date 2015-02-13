class MailingsController < ApplicationController
  skip_before_action :require_login

  def sub
    begin
      response = Mailings::MailChimpService.new(params[:email]).subscribe
      flash[:success] = "#{params[:email]} subscribed successfully"
    rescue Gibbon::MailChimpError => e
      flash[:error] = "#{e}"
    end
    redirect_to :back
  end

  def unsub
    begin
      response = Mailings::MailChimpService.new(current_user.email).unsubscribe
      flash[:success] = "#{current_user.email} unsubscribed successfully"
    rescue Gibbon::MailChimpError => e
      flash[:error] = e.message
    end
    redirect_to :back
  end
end
