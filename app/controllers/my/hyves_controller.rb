class My::HyvesController < My::BaseController
  before_action :set_user, :set_hyve

  def show
  end

  def edit
  end

  def update
    if @hyve.update(hyve_params)
      redirect_to my_hyve_path, notice: "Your hyve was successfully updated."
    else
      render :edit 
    end
  end
  
  def destroy
    @hyve.destroy
    redirect_to my_account_path, notice: "Your hyve was successfully destroyed."
  end

  private
    def set_user
      @user = current_user
    end

    def set_hyve
      @hyve = Hyve.find_by_uuid(params[:id])
    end

    def hyve_params
:A
      params.require(:hyve).permit(:name, :uuid, :distance, :image)
    end
end
