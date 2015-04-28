class PagesController < ApplicationController
  skip_before_action :require_login

  # Header
  def home
  end

  def company
  end

  def product
  end

  def press
  end

  def kickstarter
  end

  # Footer
  def faq
  end

  def contact
  end

  def tnc
  end
  
  # Others
  def soma
  end
end
