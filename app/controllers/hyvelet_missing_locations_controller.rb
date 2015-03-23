class HyveletMissingLocationsController < ApplicationController
  before_action :set_hyvelet_missing_location, only: [:show, :edit, :update, :destroy]

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
