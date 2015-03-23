class Admin::BaseController < ApplicationController
  #before_action :authenticate_admin!

  private

  #def authenticate_admin!
    #if current_user.try(:admin?)
      #authenticate_user!
    #else
      #flash[:alert] = "You are not authorized to perform this action"
      #redirect_to root_path
    #end
  #end
end
