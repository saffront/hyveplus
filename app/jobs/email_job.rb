class WelcomeEmailJob 
  include SuckerPunch::Job
  
  def perform(user)
    UserMailer.welcome(user).deliver_later
  end
end
