class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to login_path
    end
  end

  private

  def current_user
    # if session[:user_id] == nil
    #  Sessioncontroller.destroy 

    @current_user ||= User.find(session[:user_id]) if session[:user_id] # ||= (or equals) assigns item if item currently nil
  end 
 
   helper_method :current_user
  

end


