class ApplicationController < ActionController::Base
  include Pundit
  #after_action :verify_policy_scoped, only: :index
  after_action :verify_authorized, only: :index

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  #For iOS API
  skip_before_action :verify_authenticity_token, if: :json_request?

  private

  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action"
    redirect_to(request.referrer || root_path)
  end

  def json_request?
    request.format.json?
  end
end
