class Api::V1::HyvesController < Api::ApiController

  def new
    @hyve = @user.hyves.build(hyve_params)
  end

  def create
    @hyve = @user.hyves.build(hyve_params)
    if @hyve.save
      render json: @hyve
    else
      render json: { errors: @hyve.errors }
    end
  end

  def show
    @hyve = Hyve.find(params[:id]) || NilHyve.new
    render json: @hyve
  end

  def edit
  end

  def update
    if @hyve.update(hyve_params)
      render json: @hyve
    else
      render json: @hyve.errors
    end
  end

  def destroy
  end

  private
  
  def set_user
    @user = user 
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
