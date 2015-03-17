class Api::ApiController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_token

  private

  def authenticate_token
    api_token = request.headers['X-hyve-token']
    user = User.find_by_api_token(api_token)

    if api_token.present? && user
      sign_in(:user, user) 
    else
      render json: { status: :unauthorized }
    end
  end
end
