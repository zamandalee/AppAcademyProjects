class UsersController < ApplicationController
  def new #signing up
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login_user!(@user)
      # @current_user = @user
      # session[:session_token] = @current_user.session_token
      redirect_to cats_url
    else
      flash[:error] = ['Unable to create new user, check username and password validity']
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end
