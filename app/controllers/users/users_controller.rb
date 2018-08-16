class Users::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user

  def show
    @owner = User.friendly.find(1)
    @user = User.friendly.find(params[:id])
    @rsvps = @user.rsvps
  end

  def update
    
  end

  def day
    @user = User.friendly.find(params[:id])
    @rsvps = @user.rsvps
  end

  private

    def correct_user
      @owner = User.friendly.find(1)
      @user = User.friendly.find(params[:id])
      unless current_user == @user || current_user == @owner
        redirect_to root_url
      end
    end

end