class HyveletMissingLocationsController < ApplicationController
  before_action :set_hyvelet_missing_location, only: [:show, :edit, :update, :destroy]

  # GET /hyvelet_missing_locations
  # GET /hyvelet_missing_locations.json
  def index
    @hyvelet_missing_locations = HyveletMissingLocation.all
  end

  # GET /hyvelet_missing_locations/1
  # GET /hyvelet_missing_locations/1.json
  def show
  end

  # GET /hyvelet_missing_locations/new
  def new
    @hyvelet_missing_location = HyveletMissingLocation.new
  end

  # GET /hyvelet_missing_locations/1/edit
  def edit
  end

  # POST /hyvelet_missing_locations
  # POST /hyvelet_missing_locations.json
  def create
    @hyvelet_missing_location = HyveletMissingLocation.new(hyvelet_missing_location_params)

    respond_to do |format|
      if @hyvelet_missing_location.save
        format.html { redirect_to @hyvelet_missing_location, notice: 'Hyvelet missing location was successfully created.' }
        format.json { render :show, status: :created, location: @hyvelet_missing_location }
      else
        format.html { render :new }
        format.json { render json: @hyvelet_missing_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hyvelet_missing_locations/1
  # PATCH/PUT /hyvelet_missing_locations/1.json
  def update
    respond_to do |format|
      if @hyvelet_missing_location.update(hyvelet_missing_location_params)
        format.html { redirect_to @hyvelet_missing_location, notice: 'Hyvelet missing location was successfully updated.' }
        format.json { render :show, status: :ok, location: @hyvelet_missing_location }
      else
        format.html { render :edit }
        format.json { render json: @hyvelet_missing_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hyvelet_missing_locations/1
  # DELETE /hyvelet_missing_locations/1.json
  def destroy
    @hyvelet_missing_location.destroy
    respond_to do |format|
      format.html { redirect_to hyvelet_missing_locations_url, notice: 'Hyvelet missing location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hyvelet_missing_location
      @hyvelet_missing_location = HyveletMissingLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hyvelet_missing_location_params
      params.require(:hyvelet_missing_location).permit(:deviceid, :lat, :lng, :hyvelet_id)
    end
end
