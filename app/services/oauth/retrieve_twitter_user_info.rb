class Oauth::RetrieveTwitterUserInfo
  attr_accessor :token, :secret, :screen_name, :user

  def initialize(token, secret, user, screen_name)
    @token = token
    @secret = secret
    @user = user
    @screen_name = screen_name
  end

  def save
    @twitter = Initializer::TwitterClient.new(@token, @secret)

    twitter_user = @twitter.client.user(@screen_name)
    upload_profile_image(twitter_user)

    @user.update(name: twitter_user.name,
                 username: twitter_user.username)
  end

  private

  def upload_profile_image(user)
    avatar_extract = user.profile_image_url_https.to_str.gsub!("normal", "400x400")
    @user.remote_avatar_url = avatar_extract
  end
end
