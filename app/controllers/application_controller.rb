class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def user_required
    if !logged_in?
      flash[:notice] = "Please log in first."
      redirect_to login_path
    end
  end

  def belongs_to_current_user?(obj)
    logged_in? && current_user == obj.user ? true : false
  end

  def deny_access(obj)
    if !belongs_to_current_user?(obj)
      flash[:error] = "Something went wrong. Please try again."
      redirect_to root_path
    end
  end

end
