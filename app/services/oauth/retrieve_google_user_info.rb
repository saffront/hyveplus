class Oauth::RetrieveGoogleUserInfo
  attr_accessor :token, :user
  
  def initialize(token, user)
    @token = token
    @user = user

    @client_id = ENV['GOOGLE_API_KEY']
    @client_secret = ENV['GOOGLE_API_SECRET']
  end

  def save
    GooglePlus.access_token = @token

    @gplus_user = GooglePlus::Person.get("me?access_token=#{@token}")
    upload_profile_image(@gplus_user)
    @user.update(first_name: @gplus_user.name.given_name,
                 last_name: @gplus_user.name.family_name,
                 username: @gplus_user.display_name)
  end

  private

  def upload_profile_image(user)
    avatar_extract = user.image.url
    @user.remote_avatar_url = avatar_extract
  end
end
