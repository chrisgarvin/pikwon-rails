class PostsController < ApplicationController
  before_action :require_user, only: [:new, :create]

  def index

    @posts = Post.all
    @options = Option.all

  end

  def show

    @post = Post.find(params[:id])

  end

  def new

    @post = Post.new

  end

  def create

    @post = Post.new

    @option = Option.new(:option_text => params[:test][:option_text_one])

    @post.options << @option


    @option = Option.new(:option_text => params[:test][:option_text_two])

    @post.options << @option

    @post.user_id = current_user.id

    if @option.save
      @post.save
      redirect_to posts_path
    else
      render :new
    end


  end

  def destroy
    @post = Post.find(params[:id])
    @option1picks = @post.options.second.picks
    @option2picks = @post.options.first.picks
    @option1 = @post.options.first
    @option2 = @post.options.second
    @option1picks.destroy
    @option2picks.destroy
    @option1.destroy
    @option2.destroy
    @post.destroy

    redirect_to users_show_path
  end


  private

  def post_params
    params.require(:post).permit(:option_ids => [])
  end

  def option_params
    params.require(:option).permit(:option_text, :post_ids => [])
  end

end
