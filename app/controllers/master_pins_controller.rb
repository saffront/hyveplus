class MasterPinsController < ApplicationController
  before_action :set_master_pin, only: [:show, :edit, :update, :destroy]

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_pin
      @master_pin = MasterPin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def master_pin_params
      params.require(:master_pin).permit(:manufacturer, :serialnumber, :pin)
    end
end
