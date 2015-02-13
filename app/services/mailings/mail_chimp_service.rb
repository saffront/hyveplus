class Mailings::MailChimpService
  attr_reader :email, :list_id

  def initialize(email)
    @email = email
    @list_id = ENV["MAILCHIMP_LIST_ID"]
  end

  def subscribe
    Gibbon::API.new.lists.subscribe({ id: @list_id, email: { email: @email }, double_optin: false })
  end

  def unsubscribe
    Gibbon::API.new.lists.unsubscribe({ id: @list_id, email: { email: @email }, double_optin: false })
  end
end

