class HomeController < ApplicationController

  def index
    
  end

  def push
    begin     
    	data = { :alert => "This is a notification from Parse" }
      push = Parse::Push.new(data, "Giants")
      push.type = "ios"
      push.save
    rescue
      flash[:error] = "Send failed"
    end

  redirect_to root_path
  end
end