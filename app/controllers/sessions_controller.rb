class SessionsController < ApplicationController
  def new
  end

#create a new session method and log user in

  def create
  @user = User.find_by_handle(params[:session][:handle].downcase)
  if @user && @user.authenticate(params[:session][:password])
    session[:user_id] = @user.id
    redirect_to '/posts'
  else
    flash.now[:danger] = 'Invalid email/password combination'
    redirect_to '/posts'
  end
end

#destroy method to end session and log user out

def destroy
  session[:user_id] = nil
  redirect_to '/posts'
end

end
