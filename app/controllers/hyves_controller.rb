class HyvesController < ApplicationController
  before_action :set_user
  before_action :set_hyve, except: [:index]

  def index
    @hyves = @user.hyves.all 
  end

  def show
  end

  def edit
  end

  def update
    if @hyve.update(hyve_params)
      redirect_to hyve_path, notice: "Your hyve was successfully updated."
    else
      render :edit 
    end
  end
  
  def destroy
  end

  private
    def set_user
      @user = current_user
    end

    def set_hyve
      @hyve = Hyve.find(params[:id])
    end

    def hyve_params
      params.require(:hyve).permit(:name, :uuid, :distance, :status)
    end
end
