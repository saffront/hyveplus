class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  private

  def not_authenticated
    redirect_to(request.referrer || root_path, alert: "Please login first")
  end

  def user_not_authorized
    redirect_back_or_to(request.referrer || root_path, flash_hash = { alert: "You are not authorized to perform this action" } )
  end

end
