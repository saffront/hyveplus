# To support underscores, Gibbon gem (as of v.1.1.5) replace them with hyphens when calling the Mailchimp API
# See "method_missing" method in https://github.com/amro/gibbon/blob/master/lib/gibbon/api_category.rb

class Mailings::MailChimpService
  attr_reader :email

  def initialize(email)
    @email = email
  end

  def subscribed_to_early_adopters
    subscribe(ENV["MAILCHIMP_EA_LIST_ID"])
  end

  def subscribed_to_users
    subscribe(ENV["MAILCHIMP_U_LIST_ID"])
  end

  def unsubscribed_from_users
    unsubscribe(ENV["MAILCHIMP_U_LIST_ID"])
  end

  private

  def subscribe(list_id)
    Gibbon::API.new.lists.subscribe( { id: list_id, email: { email: @email }, double_optin: false } )
  end

  def unsubscribe(list_id)
    Gibbon::API.new.lists.unsubscribe( { id: list_id, email: { email: @email } } )
  end
end
