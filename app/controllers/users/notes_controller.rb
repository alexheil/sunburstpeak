class Users::NotesController < ApplicationController

  before_action :set_user

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = @user.notes.build(note_params)
    if @note.save
      flash[:notice] = "You just created " + @note.title + "!"
      redirect_to user_note_path(@user, @note)
    else
      flash.now[:alert] = 'Whoa! Something went wrong!'
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def set_user
      @user = current_user
    end

    def note_params
      params.require(:note).permit(:title, :content, :start_time, :end_time)
    end

end