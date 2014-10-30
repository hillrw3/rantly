class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(user_params)

    if @user.present? && @user.authenticate(params[:user][:password])
      unless @user.enabled
        flash[:error] = "Your account has been disabled or has not been verified"
        render :new
      else
        session[:user_id] = @user.id
        Keen.publish(:logins, {username: @user.username, date: Time.now}) if Rails.env.production?
        if current_user.admin
          redirect_to admins_path
        else
          redirect_to rants_path
        end
      end
    else
      flash[:error] = "Login failed"
      @user = User.new
      redirect_to new_session_path
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