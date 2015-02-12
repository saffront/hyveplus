class Oauth::RetrieveFacebookUserInfo
  attr_accessor :token, :user
  
  def initialize(token, user)
    @token = token
    @user = user
  end

  def save
    fb_user = FbGraph::User.fetch("me?access_token=#{@token}")
    @user.remote_avatar_url = "#{fb_user.picture}?redirect=1&height=300&type=normal&width=300"

    @user.update(name: fb_user.name,
                 avatar: fb_user.picture,
                 username: fb_user.username)
  end
end
