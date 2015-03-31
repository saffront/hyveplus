class Api::V1::HyvesController < Api::ApiController

  before_action :set_hyve, only: [:show, :destroy]

  def index
    @hyves = @user.hyves
    render json: @hyves
  end

  def show
    render json: @hyve
  end

  def create
    @hyve = @user.hyves.build(hyve_params)
    if @hyve.save
      render json: @hyve
    else
      render json: { errors: @hyve.errors }
    end
  end

  def update
    if @hyve.update(hyve_params)
      render json: @hyve
    else
      render json: @hyve.errors
    end
  end

  def destroy
    @hyve.destroy
    render json: { status: "Hyve destroyed" }
  end

  private
  
  def set_user
    @user = user 
  end

  def set_hyve
    @hyve = Hyve.find_by(id: params[:id]) || NilHyve.new
  end

  def hyve_params
    #:pin, :lat, :lng, 
    params.require(:hyve).permit(:name, :created_at, :updated_at, :user_id, :status, :distance, :uuid, :image)
  end
end

class NilHyve
  attr_accessor :error

  def initialize
    @error = "No hyve found."
  end
end
