class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(user_params)

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      Keen.publish(:logins, {username: @user.username, date: Time.now}) if Rails.env.production?
      if current_user.admin
        redirect_to admins_path
      else
        redirect_to rants_path
      end
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