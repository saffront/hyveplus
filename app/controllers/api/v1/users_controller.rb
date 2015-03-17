class Api::V1::UsersController < Api::ApiController

  #def index
    #@users = User.all
    #render json: @users
  #end

  def show
    @user = User.find(params[:id]) || NilUser.new
    render json: @user
  end
end

class NilUser
  attr_accessor :error

  def initialize
    @error = "No user found."
  end
end
