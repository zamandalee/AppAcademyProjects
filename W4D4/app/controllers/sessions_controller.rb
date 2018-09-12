class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user
      login(user)
    else
      flash.now[:errors] = 'Incorrect login information.'
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
