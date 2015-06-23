class UsersController < ApplicationController

#only allow edit/update to be utilized by currently logged in user, and verify
#that correct_user is attempting to edit info, thus preventing a user from
#editing a different users info

  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index

    @users = User.all

  end

#create a time object and a headers object array to be used in user profile for
#style purposes

  def show

    @user = User.find(params[:id])

    @time = Time.new.strftime("%A")

    @headers = ["well check you out, ", "oh snap, it's ", "if i had to pikwon i'd pick you, ",
       "oh hi ", "Q: Who's the best? A: ", "100% pretty cool -> " , "Shut up and dance, ",
       "Going up on a #{@time}: "]
    # @user = User.find(params[:id])

  end

  def new

    @user = User.new

  end

#create a new user and log user in

  def create

    @user = User.create(user_params)
    session[:user_id] = @user.id
    if @user.save
      UserMailer.welcome_email(@user).deliver
      redirect_to "/posts"
      # redirect_to user_path(@user.id)
    else
      flash[:message]
      render :new
    end

  end

  def edit

    @user = User.find(params[:id])

  end

  def update

    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end

  end

  def destroy

    @user = User.find(params[:id])

    @userPicks = @user.picks
    @userPicks.each do |pick|
      pick.destroy
    end
    @userPosts = @user.posts
    @userPosts.each do |post|
      post.options.second.destroy
      post.options.first.destroy
      post.destroy
    end
    @user.destroy

    redirect_to "/"

  end

  private

  def user_params
    params.require(:user).permit(:handle.downcase, :fname, :lname, :email, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

#private method to determine the correct_user is trying to access a particular
#users edit page

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end


end
