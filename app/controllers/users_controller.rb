class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Chatroom, #{ @user.username }"
      redirect_to root_path
    else
      flash.now[:error] = "There was a problem creating new User. Make sure all fields contain valid data and try again"
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
