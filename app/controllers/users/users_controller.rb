class Users::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user

  def show
    @user = User.friendly.find(params[:id])
    @rsvps = @user.rsvps
  end

  def day
    @user = User.friendly.find(params[:id])
    @rsvps = @user.rsvps
  end

  private

    def correct_user
      @user = User.friendly.find(params[:id])
      unless current_user == @user
        redirect_to root_url
      end
    end

end