class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

# current_user method to determine if user session is active

def current_user
 @current_user ||=
   User.find(session[:user_id]) if
 session[:user_id]
rescue ActiveRecord::RecordNotFound
end

# before_filter :require_user

def require_user
redirect_to '/signup' unless current_user
end

def logged_in?
    !current_user.nil?
  end
end
