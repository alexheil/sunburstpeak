class Posts::PostsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]
  before_action :authenticate_owner, except: [:show, :index]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.friendly.find(params[:id])
    @owner = User.friendly.find(1)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "You just created " + @post.title + "!"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = 'Whoa! Something went wrong!'
      render 'new'
    end
  end

  def edit
    @post = Post.friendly.find(params[:id])
  end

  def update
    @post = Post.friendly.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Good job!"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = 'Bad job!'
      render 'edit'
    end
  end

  def destroy
    @post = Post.friendly.find(params[:id]).destroy
    redirect_to root_url
    flash[:notice] = "Delete successful."
  end

  private

    def authenticate_owner
      @user = User.friendly.find(1)
      unless current_user == @user
        redirect_to root_url
      end
    end

    def post_params
      params.require(:post).permit(:title, :image, :description, :content)
    end

end