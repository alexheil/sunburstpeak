class Cities::CitiesController < ApplicationController

  before_action :set_user

  def show
    @city = City.friendly.find(params[:id])
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      flash[:notice] = "You just created " + @city.title + "!"
      redirect_to city_path(@city)
    else
      flash.now[:alert] = 'Whoa! Something went wrong!'
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def set_user
      @user = current_user
    end

    def city_params
      params.require(:city).permit(:title, :content, :start_time, :end_time)
    end

end