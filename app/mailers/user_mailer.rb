class UserMailer < ActionMailer::Base
  default from: "Hyve Mail <donotreply@hyveplus.com>"

  def welcome(user)
    @user = user
    mail to: user.email, subject: "Welcome to Hyve, #{user.first_name}!", from: "hello@hyveplus.com"
  end 

  def reset_password_email(user)
    @user = user
    @url = edit_password_reset_url(user.reset_password_token)
    mail to: user.email, subject: "Your password has been reset"
  end

  def send_contact_form(name, email, subject, message)
    @name = name
    @email = email
    @subject = subject
    @message = message
    mail to: "hello@hyveplus.com", subject: "#{subject}", from: "hyve_contact_form@hyveplus.com"
  end 
end
