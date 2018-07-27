class Users::UsersController < ApplicationController

  def show
    @user = User.friendly.find(params[:id])
    @rsvps = @user.rsvps
    @event
  end

  def day
    @user = User.friendly.find(params[:id])
    @rsvps = @user.rsvps
  end

  def week
    @user = User.friendly.find(params[:id])
    @rsvps = @user.rsvps
  end

  def month
    @user = User.friendly.find(params[:id])
    @rsvps = @user.rsvps
  end

end