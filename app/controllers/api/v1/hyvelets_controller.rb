class Api::V1::HyveletsController < Api::ApiController

  #def index
    #@hyvelets = Hyvelet.all
    #render json: @hyvelets
  #end

  def show
    @hyvelet = Hyvelet.find(params[:id]) || NilHyvelet.new
    render json: @user
  end
end

class NilHyvelet
  attr_accessor :error

  def initialize
    @error = "No hyvelet found."
  end
end
