class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to rants_path
    else
      flash[:notice] = "Login failed"
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end