class HyveMissingLocationsController < ApplicationController
  before_action :set_hyve_missing_location, only: [:show, :edit, :update, :destroy]

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hyve_missing_location
      @hyve_missing_location = HyveMissingLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hyve_missing_location_params
      params.require(:hyve_missing_location).permit(:deviceid, :lat, :lng, :hyve_id)
    end
end
