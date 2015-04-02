class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all.order(:id)
    authorize @users
  end

end
