class PagesController < ApplicationController
  skip_before_action :require_login

  ###Header###
  def home
  end

  def company
  end

  def product
  end

  def press
  end

  def order
  end
  ###Footer###
  def faq
  end

  def contact
  end

  def tnc
  end

  #def push
    #begin     
      #data = { :alert => "This is a notification from Parse" }
      #push = Parse::Push.new(data, "Giants")
      #push.type = "ios"
      #push.save
    #rescue
      #flash[:error] = "Send failed"
    #end
    #redirect_to root_path
  #end

end
