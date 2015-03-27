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
      if logged_in?
        link_account(provider)
      else
        register_new_user(provider)
      end
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
    redirect_to edit_profile_my_account_path(current_user)
  end

  def save_facebook_info
    set_access_token(@user)
    Oauth::RetrieveFacebookUserInfo.new(@access_token.token, @user).save
  end

  def save_google_info
    set_access_token(@user)
    Oauth::RetrieveGoogleUserInfo.new(@access_token.token, @user).save
  end

  def link_account(provider)
    if current_user.authentications.find_by(provider: provider).blank? && @user = add_provider_to_user(provider)
      flash[:notice] = "You have successfully linked your #{provider.titleize} account."
    else
      flash[:alert] = "There was a problem linking your #{provider.titleize} account."
    end

    set_access_token(current_user)
    redirect_to my_account_path
  end

  def set_access_token(user)
    case params[:provider]
    when "facebook"
      user.set_access_token(@access_token.token, nil, params[:provider])
    when "google"
      user.set_access_token(@access_token.token, nil, params[:provider])
    end
  end
  
end
