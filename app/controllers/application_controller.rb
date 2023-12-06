class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  # current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # current_user
  def logged_in?
    !!current_user
  end
end
