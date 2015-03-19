class Initializer::GplusClient
  attr_accessor :token, :secret, :client

  def initialize(token)
    @token = token
    @secret = secret
  
    @client_id = ENV['GOOGLE_API_KEY']
    @client_secret = ENV['GOOGLE_API_SECRET']
    @access_token = token
    @access_token_secret = secret

    @client = Gplus::Client.new( 
      client_id: @client_id,
      client_secret: @client_secret,
      token: @access_token,
      redirect_uri: "http://127.0.0.1:3000/oauth/callback?provider=google"
      )
  end
end
