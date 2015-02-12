class OauthController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(auth_params[:provider])
  end

  #def callback
    #provider = auth_params[:provider]
    #if @user = login_from(provider)
      #redirect_to root_path, notice: "Logged in from #{provider.titleize}"
    #else
      #@user = create_and_validate_from(provider)
      #@user.activate!
      #reset_session
      #auto_login(@user)
      #redirect_to root_path, notice: "Logged in from #{provider.titleize}"
    #end
  #end
  def callback
    provider = auth_params[:provider]

    if @user = login_from(provider)

      set_access_token(@user)
      flash[:success] = "You're logged in from #{provider.titleize}!"
      redirect_to user_path(@user)
    else
                                            
      if logged_in?
        link_account(provider)
        binding.pry
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
    # begin
      @user = create_and_validate_from(provider)
      reset_session
      binding.pry

      case provider
      when "twitter"
        save_twitter_info
      when "facebook"
        save_facebook_info
      end

        auto_login(@user)
        flash[:notice] = "You've registered through #{provider.titleize}!"
        redirect_to edit_user_path(current_user)
    # rescue => e
    #   logger.info "[ERROR]: #{e.inspect}"
    #   flash[:alert] = "Failed to login from #{provider.titleize}"
    #   redirect_to root_path
    # end
  end

  def save_twitter_info
    set_access_token(@user)
    Oauth::RetrieveTwitterUserInfo.new(@access_token.token, @access_token.secret, @user, @access_token.params[:screen_name]).save
  end

  def save_facebook_info
    set_access_token(@user)
    Oauth::RetrieveFacebookUserInfo.new(@access_token.token, @user).save
  end

  def link_account(provider)
    if current_user.authentications.find_by(provider: provider).blank? && @user = add_provider_to_user(provider)
      flash[:notice] = "You have successfully linked your #{provider.titleize} account."
    else
      flash[:alert] = "There was a problem linking your #{provider.titleize} account."
    end

    set_access_token(current_user)
    redirect_to user_path(current_user)
  end

  def set_access_token(user)
    case params[:provider]
    when "facebook"
      user.set_access_token(@access_token.token, nil, params[:provider])
    when "twitter"
      user.set_access_token(@access_token.params[:oauth_token], @access_token.params[:oauth_token_secret], params[:provider])
    when "google"
      user.set_access_token(@access_token.token, nil, params[:provider])
    end
  end
  
end
