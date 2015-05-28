class UsersController < ApplicationController

  def index

    @users = User.all

  end

  def show

    @headers = ["well check you out, ", "oh snap, it's ", "if i had to pikwon i'd pick you, ",
       "oh hi ", "Q: Who's the best? A: ", "100% pretty cool -> "]
    # @user = User.find(params[:id])

  end

  def new

    @user = User.new

  end

  def create

    @user = User.new(user_params)
    session[:user_id] = @user.id
    if @user.save
      redirect_to "/"
    else
      render :new
    end

  end

  private

  def user_params
    params.require(:user).permit(:handle, :fname, :lname, :email, :password)
  end

end
