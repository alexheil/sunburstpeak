class Users::LikesController < ApplicationController

  before_action :authenticate_user!
  
  def create
    @user = current_user
    @city = City.friendly.find(params[:city_id])
    @thing = Thing.friendly.find(params[:thing_id])
    @like = Like.new
    @like.user_id = @user.id
    @like.thing_id = @thing.id
    if @like.save
      respond_to do |format|
        format.html { redirect_to city_thing_path(@city, @thing) }
        format.js { render :action => "likes" }
        flash.now[:notice] = "You have successfully likeed #{@thing.title}!"
      end
    else
      redirect_to city_thing_path(@city, @thing)
      flash[:alert] = "You have failed."
    end
  end

  def destroy
    @user = current_user
    @city = City.friendly.find(params[:city_id])
    @thing = Thing.friendly.find(params[:thing_id])
    @user.unlike(@thing)
    respond_to do |format|
      format.html { redirect_to city_thing_path(@city, @thing) }
      format.js { render :action => "likes" }
      flash.now[:notice] = "You unlikeed #{@thing.title}!"
    end
  end

end