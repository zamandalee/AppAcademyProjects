class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :login_user!#, :user_is_owner?

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login_user!(user)
    @current_user = user
    session[:session_token] = @current_user.session_token
  end

  # def user_is_owner?(cat)
  #   !!current_user.cats.find(params[:id])
  # end
end
