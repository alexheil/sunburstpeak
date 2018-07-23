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
    if @event.save
      flash[:notice] = "You just created " + @event.title + "!"
      redirect_to city_event_path(@city, @event)
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

    def event_params
      params.require(:event).permit(:city_id, :title, :content, :start_time, :end_time, :month, :day, :year)
    end

end