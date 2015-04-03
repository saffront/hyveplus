class UserMailer < ActionMailer::Base
  default from: "Hyve Mail <donotreply@hyve.com>"

  def welcome(user)
    @user = user
    mail to: user.email, subject: "Welcome to Hyve, #{user.first_name}!", from: "jiashern@hyve.com"
  end 

  def reset_password_email(user)
    @user = user
    @url = edit_password_reset_url(user.reset_password_token)
    mail to: user.email, subject: "Your password has been reset"
  end
end
