class PagesController < ApplicationController
  skip_before_action :require_login

  ###About###
  def company
  end

  def product
  end

  def press
  end
  ###End###

  def home
  end

  def order
  end

end
