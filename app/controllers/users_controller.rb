class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.ip_id = IPAddress.find_by(ip: request.remote_ip).id

    if @user.save
      flash[:notice] = "Thanks for registering.  Get to ranting!"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @following_check = Follower.find_by(user_id: session[:user_id], following: @user.id)
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    @user.update_attributes(user_params)

    if @user.save
      flash[:notice] = "Your info has been updated!"
      redirect_to rants_path
    else
      flash[:error] = "Something went wrong...."
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :rant_frequency, :avatar)
  end

end