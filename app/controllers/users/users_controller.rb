class Users::UsersController < ApplicationController

  def show
    @user = User.friendly.find(params[:id])
    @events = Event.all
  end

  def day
    @events = Event.all
  end

  def week
    @events = Event.all
  end

  def month
    @events = Event.all
  end

end