class HomeController < ApplicationController

  def index
    @a = 1
  end

  def push     
  	data = { :alert => "This is a notification from Parse" }
  	push = Parse::Push.new(data, "Giants")
  	push.type = "android"
  	push.save
  	redirect_to root_path
  end
end