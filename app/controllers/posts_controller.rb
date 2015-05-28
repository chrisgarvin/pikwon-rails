class PostsController < ApplicationController
  before_action :require_user, only: [:new, :create]

  def index

    @posts = Post.all

  end

  def show

    @post = Post.find(params[:id])

  end

  def new

    @post = Post.new

  end

  def create

    @post = Post.new(params.require(:post).permit(:option_text, :option_text, :privacy))

    if @post.save
      redirect_to posts_path
    else
      render :new
    end

  end
end
