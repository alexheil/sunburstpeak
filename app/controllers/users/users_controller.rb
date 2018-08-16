class Users::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user

  def show
    @owner = User.friendly.find(1)
    @user = User.friendly.find(params[:id])
    @rsvps = @user.rsvps
  end

  def update
    @user = User.friendly.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Good job!"
      redirect_to user_path(@path)
    else
      flash.now[:alert] = 'Bad job!'
      redirect_to user_path(@path)
    end
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

    def user_params
      params.require(:user).permit(:banned)
    end

end