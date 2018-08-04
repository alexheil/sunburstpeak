 class StaticPagesController < ApplicationController

  def home
    @cities = City.all
  end

end