class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(user_params)

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to rants_path
    else
      flash[:error] = "Login failed"
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end