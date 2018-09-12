class SessionsController < ApplicationController
  before_action :redirect_when_logged_in, only: [:new]

  def new #logging in
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:user_name],params[:user][:password])

    if @user
      login_user!(@user)

      redirect_to cats_url #cats index page
    else
      flash[:error] = ['Invalid username or password']
    end
  end

  def destroy
    @current_user.reset_session_token! if @current_user
    session[:session_token]=""
    redirect_to new_session_url
  end

  private
  def redirect_when_logged_in
    if logged_in?
      redirect_to cats_url
    end
  end

end
