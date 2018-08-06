class Cities::CitiesController < ApplicationController

  before_action :set_user

  def show
    @city = City.friendly.find(params[:id])
    @events = @city.events
    @things = @city.things.popular.limit(10)
    @owner = User.friendly.find(1)
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
    @city = City.friendly.find(params[:id])
  end

  def update
    @city = City.friendly.find(params[:id])
    if @city.update_attributes(city_params)
      flash[:notice] = "Good job!"
      redirect_to city_path(@city)
    else
      flash.now[:alert] = 'Bad job!'
      render 'edit'
    end
  end

  def destroy
    @city = City.friendly.find(params[:id]).destroy
    redirect_to root_url
    flash[:notice] = "Delete successful."
  end

  def day
    @city = City.friendly.find(params[:id])
    @events = Event.all
  end

  private

    def set_user
      @user = current_user
    end

    def city_params
      params.require(:city).permit(:title, :image, :city, :state, :country, :incorporated, :population, :latitude, :longitude)
    end

end