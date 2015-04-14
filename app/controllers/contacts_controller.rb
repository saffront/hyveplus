class ContactsController < ApplicationController
  skip_before_action :require_login

  def send_contact_form
    ContactFormJob.new.async.perform(params[:name], params[:email], params[:subject], params[:message])
    flash[:notice] = "Your message has been delivered. We will contact you shortly."
    redirect_to (request.referrer || root_path)
  end
end
