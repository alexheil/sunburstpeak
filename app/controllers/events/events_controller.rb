class Events::EventsController < ApplicationController

  before_action :authenticate_user!, except: :show
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_user
  before_action :banned, except: [:show, :index]
  before_action :confirmed, except: [:show, :index]

  def show
    @owner = User.friendly.find(1)
    @city = City.friendly.find(params[:city_id])
    @event = Event.friendly.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def new_no_date
    @event = Event.new
  end

  def new_no_city
    @event = Event.new
  end

  def new_date_and_city
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @city = City.friendly.find(@event.city_id)
    @event.user_id = current_user.id
    if @event.save
      flash[:notice] = "You just created " + @event.title + "!"
      redirect_to city_event_path(@city, @event)
    else
      flash.now[:alert] = 'Whoa! Something went wrong!'
      render 'new'
    end
  end

  def edit
    @city = City.friendly.find(params[:city_id])
    @event = Event.friendly.find(params[:id])
  end

  def update
    @city = City.friendly.find(params[:city_id])
    @event = Event.friendly.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:notice] = "Good job!"
      redirect_to city_event_path(@city, @event)
    else
      flash.now[:alert] = 'Bad job!'
      render 'edit'
    end
  end

  def destroy
    @city = City.friendly.find(params[:city_id])
    @event = Event.friendly.find(params[:id]).destroy
    redirect_to root_url
    flash[:notice] = "Delete successful."
  end

  private

    def set_user
      @user = current_user
    end

    def correct_user
      @owner = User.friendly.find(1)
      @city = City.friendly.find(params[:city_id])
      @event = Event.friendly.find(params[:id])
      @user = User.friendly.find(@event.user_id)
      unless current_user == @user || current_user = @owner
        redirect_to root_url
      end
    end

    def confirmed
      @user = current_user
      if @user.confirmed_at.blank?
        redirect_to root_url
      end
    end

    def banned
      @user = current_user
      if @user.banned?
        redirect_to root_url
      end
    end

    def event_params
      params.require(:event).permit(:city_id, :title, :venue, :category, :description, :what_to_bring, :what_to_wear, :where_to_park, :website, :address, :start_hour, :start_minute, :end_hour, :end_minute, :month, :day, :year, :start_time, :end_time, :latitude, :longitude, :image, :remove_image, :event_type, :start_am_pm, :end_am_pm, :sponsored, :street_number, :street_name, :city_name, :state_name, :country_name, :zip_code, :suite_number, :price)
    end

end