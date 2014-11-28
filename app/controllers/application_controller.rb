class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception  

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'users', :action => 'login')
      return false #halt the before_action
    else
      return true
    end
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

end
