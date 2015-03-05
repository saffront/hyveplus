class HyveletsController < ApplicationController
  before_action :set_hyvelet, only: [:show, :edit, :update, :destroy]

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hyvelet
      @hyvelet = Hyvelet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hyvelet_params
      params.require(:hyvelet).permit(:user, :name, :pin, :lat, :lng)
    end
end
