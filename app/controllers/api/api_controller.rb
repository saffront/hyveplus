class Api::ApiController < ActionController::Base
  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }
  before_action :authenticate_token
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
end
