class My::HyvesController < My::BaseController
  before_action :set_hyve

  def update
    if @hyve.update(hyve_params)
      redirect_to my_account_path, notice: "Your hyve was successfully updated."
    else
      flash[:error] = @hyve.errors.full_messages
      redirect_to my_account_path
    end
  end

  private

  def set_hyve
    # Friendly ID implementation
    @hyve = Hyve.find_by(uuid: params[:id])
  end

  def hyve_params
    params.require(:hyve).permit(:name, :distance, :image)
  end
end
