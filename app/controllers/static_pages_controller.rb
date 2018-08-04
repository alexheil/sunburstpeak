 class StaticPagesController < ApplicationController

  def home
    @cities = City.all
  end

  def about
  end

  def faq
  end

  def updates
  end

  def privacy
  end

  def terms
  end

end