class ContactFormJob
  include SuckerPunch::Job
  
  def perform(name, email, subject, message)
    UserMailer.send_contact_form(name, email, subject, message).deliver_later
  end
end
