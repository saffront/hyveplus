class Api::V1::UsersController < Api::ApiController

  def show
    #Hacky workaround to avoid ActiveRecord::RecordNotFound error from using find method (because of Friendly ID implementation)
    if params[:id].to_i == 0
      @user = User.find(params[:id]) || NilUser.new
    else
      @user = User.find_by(id: params[:id]) || NilUser.new
    end
    render json: @user
  end
end

class NilUser
  attr_accessor :error

  def initialize
    @error = "No user found."
  end
end
