class Oauth::RetrieveFacebookUserInfo
  attr_accessor :token, :user
  
  def initialize(token, user)
    @token = token
    @user = user
  end

  def save
    fb_user = FbGraph::User.fetch("me?access_token=#{@token}")

    @user.remote_avatar_url = "#{fb_user.picture}?redirect=1&height=300&type=normal&width=300"
    @username = fb_user.first_name + " " + fb_user.last_name

    @user.update(first_name: fb_user.first_name,
                 last_name: fb_user.last_name,
                 username: @username)
  end
end
