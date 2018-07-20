class Users::UsersController < ApplicationController

  def show
    @user = User.friendly.find(params[:id])
    @notes = Note.all
    @todos = Todo.all
  end

  def day
    @notes = Note.all
    @todos = Todo.all
  end

  def week
    @notes = Note.all
    @todos = Todo.all
  end

  def month
    @notes = Note.all
    @todos = Todo.all
  end

end