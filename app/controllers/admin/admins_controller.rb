class Admin::AdminsController < ApplicationController
  #before_action :authenticate_admin!

  private

  #def authenticate_admin!
    #if current_user && !current_user.admin?
      #flash[:notice] = "You are not authorized"
      #redirect_to root_path
    #end
  #end
end
