class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
    authorize @users
    #@users = policy_scope(User.all)
  end

end