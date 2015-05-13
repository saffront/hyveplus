class PasswordEmailJob 
  include SuckerPunch::Job
  
  def perform(user, password)
    UserMailer.email_password(user, password).deliver_later
  end
end
