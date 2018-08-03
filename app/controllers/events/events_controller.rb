class Events::EventsController < ApplicationController

  before_action :set_user

  def show
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
  end

  private

    def set_user
      @user = current_user
    end

    def event_params
      params.require(:event).permit(:city_id, :title, :venue, :category, :description, :what_to_bring, :what_to_wear, :where_to_park, :website, :address, :start_hour, :start_minute, :end_hour, :end_minute, :month, :day, :year, :start_time, :end_time, :latitude, :longitude, :image, :remove_image, :event_type, :start_am_pm, :end_am_pm)
    end

end