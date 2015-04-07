class Admin::HyvesController < Admin::AdminsController
  before_action :set_hyve, except: [:index]

  def index
    @hyves = Hyve.all.order(:id)
    authorize @hyves
  end

  def show
  end

  def edit
  end

  def update
    if @hyve.update(hyve_params)
      redirect_to admin_hyve_path(@hyve)
    else
      render :edit
    end
  end

  def destroy
    @hyve.destroy
    redirect_to admin_hyves_path, notice: "#{@hyve.name}-#{@hyve.user.email} successfully deleted from the database."
  end

  private

  def set_hyve
    @hyve = Hyve.find_by_uuid(params[:id])
  end

  def hyve_params
    params.require(:hyve).permit(:name, :uuid, :distance, :status)
  end
end
