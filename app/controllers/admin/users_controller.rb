class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
    authorize @users
  end

end
