class Events::EventsController < ApplicationController

  before_action :set_user

  def show
    @city = City.friendly.find(params[:id])
    @event = Event.friendly.find(params[:id])
  end

  def new
    @city = City.friendly.find(params[:id])
    @event = Event.new
  end

  def create
    @city = City.friendly.find(params[:id])
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "You just created " + @event.title + "!"
      redirect_to event_path(@event)
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
      params.require(:event).permit(:title, :content, :start_time, :end_time)
    end

end