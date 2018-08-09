class Cities::CitiesController < ApplicationController

  before_action :authenticate_user!, except: [:show, :day]
  before_action :authenticate_owner, except: [:show, :day]

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

    def authenticate_owner
      @user = User.friendly.find(1)
      unless current_user == @user
        redirect_to root_url
      end
    end

    def city_params
      params.require(:city).permit(:title, :image, :city, :state, :country, :description, :latitude, :longitude)
    end

end