class Api::ApiController < ActionController::Base
  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }
  before_action :authenticate_token
  #before_action :set_default_response_format

  #For iOS API
  #skip_before_action :verify_authenticity_token, if: :json_request?

  private

  def authenticate_token
    api_token = request.headers['X-hyve-token']
    user = User.find_by_api_token(api_token)

    if api_token.present? && user
      auto_login(user)
    else
      render json: { status: :unauthorized }
    end
  end

  #def set_default_response_format
    #request.format = :json
  #end

  #def json_request?
    #request.format.json?
  #end
end
