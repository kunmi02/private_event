class ApplicationController < ActionController::Base
  def logged_in?
    return true if session[:current_user_id]
  end

  private

  def require_login
    unless logged_in?
      flash[:notice] = 'You must be logged in to access this section'
      redirect_to root_path
    end
  end
end
