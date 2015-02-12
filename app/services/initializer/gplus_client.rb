#class Initializer::GplusClient
  #attr_accessor :token, :refresh_token, :secret, :client

  #def initialize(token, refresh_token, secret)
    #@token = token
    #@secret = secret
    #@refresh_token = refresh_token    
  
    #@client_id = ENV['GOOGLE_API_KEY']
    #@client_secret = ENV['GOOGLE_API_SECRET']
    #@access_token = token

    #@client = Gplus::Client.new( 
      #token: @access_token
      #refresh_token: @refresh_token
      #client_id: @client_id
      #client_secret: @client_secret
      #redirect_uri: "http://127.0.0.1:3000/oauth/callback?provider=google"
      #)
  #end
