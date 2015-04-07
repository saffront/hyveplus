class MailingsController < ApplicationController
  before_action :require_login, only: [:sub_users, :unsub_users]
  before_action :set_user, only: [:sub_users, :unsub_users]

  def sub_adopters
    mailchimp("subscribed_to_early_adopters")
  end

  def sub_users
    mailchimp("subscribed_to_users", true)
  end

  def unsub_users
    mailchimp("unsubscribed_from_users", false)
  end

  private

  def set_user
    @user = current_user
  end

  def mailchimp(action, boolean={} )
    @action = create_nice_sentence(action)
    begin
      response = Mailings::MailChimpService.new(params[:email]).send(action)
      @user.update(subscription: boolean) if @user
      flash[:notice] = "#{params[:email]} #{@action} newsletter successfully"
    rescue Gibbon::MailChimpError => e
      flash[:error] = e.message
    end
    redirect_to :back
  end

  def create_nice_sentence(action)
    @split = action.gsub(/_/, " ").split
    @uppercase = @split.drop(2).collect { |s| s.capitalize }
    @combine = @split[0] + " " + @split[1] + " " + @uppercase.join
  end
end
