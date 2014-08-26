class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  private
  def current_user
    @current_user ||= User.find_by_session_token(session[:token])
  end
  
  def logged_in?
    !!@current_user
  end
  
  def login_user(user)
    @current_user = user
    session[:token] = user.reset_session_token!
  end
  
  def logout_user
    @current_user.reset_session_token!
    session[:token] = nil
  end
  
  def require_logged_in!
    redirect_to new_session_url unless logged_in?
  end
end
