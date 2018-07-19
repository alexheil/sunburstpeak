class Users::UsersController < ApplicationController

  def show
    @user = User.friendly.find(params[:id])
    @notes = Note.all
  end

  def day
    @notes = Note.all
  end

  def week
    @notes = Note.all
  end

  def month
    @notes = Note.all
  end

end