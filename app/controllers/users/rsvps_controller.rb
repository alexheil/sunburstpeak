class Users::RsvpsController < ApplicationController

  def create
    @user = current_user
    @city = City.friendly.find(params[:city_id])
    @event = Event.friendly.find(params[:event_id])
    @rsvp = rsvp.new
    @rsvp.user_id = @user.id
    @rsvp.event_id = @event.id
    if @rsvp.save
      redirect_to city_event_path(@city, @event)
      # respond_to do |format|
      #   format.html { redirect_to city_event_path(@city, @event) }
      #   format.js { render :action => "rsvps" }
      #   flash.now[:notice] = "You have successfully rsvped #{@event.title}!"
      # end
    else
      redirect_to city_event_path(@city, @event)
      flash[:alert] = "You have failed."
    end
  end

  def destroy
    @user = current_user
    @city = City.friendly.find(params[:city_id])
    @event = Event.friendly.find(params[:event_id])
    @user.unrsvp(@event)
    redirect_to city_event_path(@city, @event)
    # respond_to do |format|
    #   format.html { redirect_to city_event_path(@city, @event) }
    #   format.js { render :action => "rsvps" }
    #   flash.now[:notice] = "You unrsvped #{@event.title}!"
    # end
  end

end