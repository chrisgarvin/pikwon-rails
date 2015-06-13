class PostsController < ApplicationController

  #requre a user being logged in to create a post

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

#create new post object

    @post = Post.new

#check to see if options input are duplicates, render new if so to prevent duplicates

    if params[:test][:option_text_one].strip == params[:test][:option_text_two].strip

      render :new

#else create post with options

    else

#create option and shovel option into post, do this twice with both options

      @option = Option.new(:option_text => params[:test][:option_text_one])

      @post.options << @option

      @option = Option.new(:option_text => params[:test][:option_text_two])

      @post.options << @option

      @post.user_id = current_user.id

#if post is saved with no errors, redirect to posts, else render new

      if @option.save
        @post.save
        redirect_to posts_path
      else
        redirect_to new_post_path
      end
    end

  end

#destroy post and all picks/options associated with it, and redirect to user profile

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

    redirect_to user_path(current_user.id)
  end

#create option/post params

  private

  def post_params
    params.require(:post).permit(:option_ids => [])
  end

  def option_params
    params.require(:option).permit(:option_text, :post_ids => [])
  end

end
