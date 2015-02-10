class HyveletsController < ApplicationController
  before_action :set_hyvelet, only: [:show, :edit, :update, :destroy]

  # GET /hyvelets
  # GET /hyvelets.json
  def index
    @hyvelets = Hyvelet.all
  end

  # GET /hyvelets/1
  # GET /hyvelets/1.json
  def show
  end

  # GET /hyvelets/new
  def new
    @hyvelet = Hyvelet.new
  end

  # GET /hyvelets/1/edit
  def edit
  end

  # POST /hyvelets
  # POST /hyvelets.json
  def create
    @hyvelet = Hyvelet.new(hyvelet_params)

    respond_to do |format|
      if @hyvelet.save
        format.html { redirect_to @hyvelet, notice: 'Hyvelet was successfully created.' }
        format.json { render :show, status: :created, location: @hyvelet }
      else
        format.html { render :new }
        format.json { render json: @hyvelet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hyvelets/1
  # PATCH/PUT /hyvelets/1.json
  def update
    respond_to do |format|
      if @hyvelet.update(hyvelet_params)
        format.html { redirect_to @hyvelet, notice: 'Hyvelet was successfully updated.' }
        format.json { render :show, status: :ok, location: @hyvelet }
      else
        format.html { render :edit }
        format.json { render json: @hyvelet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hyvelets/1
  # DELETE /hyvelets/1.json
  def destroy
    @hyvelet.destroy
    respond_to do |format|
      format.html { redirect_to hyvelets_url, notice: 'Hyvelet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

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
