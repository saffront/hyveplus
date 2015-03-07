class PagesController < ApplicationController
  skip_before_action :require_login

  def home
  end

  def press
  end

end
