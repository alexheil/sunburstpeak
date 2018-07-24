class Users::UsersController < ApplicationController

  def show
    @user = User.friendly.find(params[:id])
    @events = Event.all
  end

  def day
    @user = User.friendly.find(params[:id])
    @events = Event.all
  end

  def week
    @user = User.friendly.find(params[:id])
    @events = Event.all
  end

  def month
    @user = User.friendly.find(params[:id])
    @events = Event.all
  end

end