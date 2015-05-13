class OauthController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(auth_params[:provider])
  end
  
  def callback
    provider = auth_params[:provider]

    if @user = login_from(provider)
      set_access_token(@user)
      flash[:success] = "You're logged in from #{provider.titleize}!"
      redirect_to my_account_path
    else
      register_new_user(provider)
    end
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end

  def register_new_user(provider)
    @user = create_and_validate_from(provider)
    reset_session

    case provider
    when "facebook"
      save_facebook_info
    when "google"
      save_google_info
    end
  
    auto_login(@user)
    flash[:notice] = "You've registered through #{provider.titleize}!"
    redirect_to my_account_path
  end

  def save_facebook_info
    set_access_token(@user)
    Oauth::RetrieveFacebookUserInfo.new(@access_token.token, @user).save
  end

  def save_google_info
    set_access_token(@user)
    Oauth::RetrieveGoogleUserInfo.new(@access_token.token, @user).save
  end

  def set_access_token(user)
    auth = user.authentications.find_by(provider: params[:provider])
    auth.update(token: @access_token.token, provider: params[:provider])
  end
end
