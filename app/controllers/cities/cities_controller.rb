class Users::TodosController < ApplicationController

  before_action :set_user

  def show
    @todo = Todo.friendly.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = @user.todos.build(todo_params)
    if @todo.save
      flash[:notice] = "You just created " + @todo.title + "!"
      redirect_to user_todo_path(@user, @todo)
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

    def todo_params
      params.require(:todo).permit(:title, :content, :start_time, :end_time)
    end

end