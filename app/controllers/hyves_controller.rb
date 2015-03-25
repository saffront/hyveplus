class HyvesController < ApplicationController
  before_action :set_hyve, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @user.update(hyve_params)
      redirect_to hyve_path, notice: "Your hyve was successfully updated."
    else
      render :edit 
    end
  end
  
  #def destroy
  #end

  private
    def set_hyve
      @hyve = Hyve.find(params[:id])
    end

    def hyve_params
      params.require(:hyve).permit(:name, :uuid, :distance, :status)
    end
end
