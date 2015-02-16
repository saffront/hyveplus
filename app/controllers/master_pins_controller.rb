class MasterPinsController < ApplicationController
  before_action :set_master_pin, only: [:show, :edit, :update, :destroy]

  # GET /master_pins
  # GET /master_pins.json
  def index
    @master_pins = MasterPin.all
  end

  # GET /master_pins/1
  # GET /master_pins/1.json
  def show
  end

  # GET /master_pins/new
  def new
    @master_pin = MasterPin.new
  end

  # GET /master_pins/1/edit
  def edit
  end

  # POST /master_pins
  # POST /master_pins.json
  def create
    @master_pin = MasterPin.new(master_pin_params)

    respond_to do |format|
      if @master_pin.save
        format.html { redirect_to @master_pin, notice: 'Master pin was successfully created.' }
        format.json { render :show, status: :created, location: @master_pin }
      else
        format.html { render :new }
        format.json { render json: @master_pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master_pins/1
  # PATCH/PUT /master_pins/1.json
  def update
    respond_to do |format|
      if @master_pin.update(master_pin_params)
        format.html { redirect_to @master_pin, notice: 'Master pin was successfully updated.' }
        format.json { render :show, status: :ok, location: @master_pin }
      else
        format.html { render :edit }
        format.json { render json: @master_pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_pins/1
  # DELETE /master_pins/1.json
  def destroy
    @master_pin.destroy
    respond_to do |format|
      format.html { redirect_to master_pins_url, notice: 'Master pin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

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
