class MailingsController < ApplicationController
  def sub_adopters
    begin
      response = Mailings::MailChimpService.new(params[:email]).subscribed_to_early_adopters
      flash[:success] = "#{params[:email]} subscribed to Early Adopters newsletter successfully"
    rescue Gibbon::MailChimpError => e
      flash[:error] = e.message
    end
    redirect_to :back
  end
end
