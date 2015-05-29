class PostsController < ApplicationController
  before_action :require_user, only: [:new, :create]

  def index

    @posts = Post.all
    @options = Option.all

    @option1 = "Option 1".upcase
    @option2 = "Option 2".upcase

  end

  def show

    @post = Post.find(params[:id])

  end

  def new

    @option = Option.new
    @post = Post.new

  end

  def create

    @option = Option.new(option_params)
    @post = Post.new
    @post.user_id = current_user.id
    @post.options << @option
    @option = Option.new(option_params)
    @post.options << @option

    if @option.save
      @option.post_id = @post.id
      @post.save
      redirect_to posts_path
    else
      render :new
    end


  end

  private

  def post_params
    params.require(:post).permit(:option_text, :option_ids => [])
  end

  def option_params
    params.require(:option).permit(:option_text, :post_ids => [])
  end

end
