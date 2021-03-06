class Cities::ThingsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index, :free]
  before_action :authenticate_owner, except: [:show, :index, :free]

  def free
    @city = City.friendly.find(params[:city_id])
    @things = @city.things.where(:thing_type => :free).popular
  end

  def index
    @city = City.friendly.find(params[:city_id])
    @things = @city.things.popular
  end

  def show
    @city = City.friendly.find(params[:city_id])
    @thing = Thing.friendly.find(params[:id])
    @owner = User.friendly.find(1)
  end

  def new
    @city = City.friendly.find(params[:city_id])
    @thing = Thing.new
  end

  def create
    @city = City.friendly.find(params[:city_id])
    @thing = @city.things.build(thing_params)
    if @thing.save
      flash[:notice] = "You just created " + @thing.title + "!"
      redirect_to city_thing_path(@city, @thing)
    else
      flash.now[:alert] = 'Whoa! Something went wrong!'
      render 'new'
    end
  end

  def edit
    @city = City.friendly.find(params[:city_id])
    @thing = Thing.friendly.find(params[:id])
  end

  def update
    @city = City.friendly.find(params[:city_id])
    @thing = Thing.friendly.find(params[:id])
    if @thing.update_attributes(thing_params)
      flash[:notice] = "Good job!"
      redirect_to city_thing_path(@city, @thing)
    else
      flash.now[:alert] = 'Bad job!'
      render 'edit'
    end
  end

  def destroy
    @city = City.friendly.find(params[:city_id])
    @thing = Thing.friendly.find(params[:id]).destroy
    redirect_to root_url
    flash[:notice] = "Delete successful."
  end

  private

    def authenticate_owner
      @user = User.friendly.find(1)
      unless current_user == @user
        redirect_to root_url
      end
    end

    def thing_params
      params.require(:thing).permit(:city_id, :title, :venue, :category, :description, :what_to_bring, :what_to_wear, :where_to_park, :website, :address, :latitude, :longitude, :image, :thing_type)
    end

end