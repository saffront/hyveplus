class Admin::HyvesController < Admin::BaseController

  def index
    @hyves = Hyve.all.order(:id)
    authorize @hyves
  end

end
