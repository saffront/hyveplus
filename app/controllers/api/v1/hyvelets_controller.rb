class Api::V1::HyveletsController < Api::ApiController

  def index
    @hyvelets = Hyvelet.all
    render json: @hyvelets
  end

  def show
    @hyvelet = Hyvelet.find(params[:id]) || NilHyvelet.new
    render json: @user
  end

  def edit
  end

  def update
    if @hyvelet.update(hyvelet_params)
      render json: @hyvelet
    else
      render json: @task.errors
    end
  end

  def destroy
  end

  private

  def hyvelet_params
    params.require(:hyvelet).permit(:name, :pin, :lat, :lng, :created_at, :updated_at, :user_id, :status, :distance, :uuid, :image)
  end
end

class NilHyvelet
  attr_accessor :error

  def initialize
    @error = "No hyvelet found."
  end
end
