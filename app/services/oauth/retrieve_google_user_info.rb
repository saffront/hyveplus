class Oauth::RetrieveGoogleUserInfo
  attr_accessor :token, :user
  
  def initialize(token, user)
    @token = token
    @user = user
  end

  def save
    #google_user =  
    #fb_user = FbGraph::User.fetch("me?access_token=#{@token}")
    @user.remote_image_url = "#{fb_user.picture}?redirect=1&height=300&type=normal&width=300"
    location_array = fb_user.location.name.split(', ')

    @user.update(name: fb_user.name,
                 username: fb_user.name)
  end
end
