class RantsController < ApplicationController

  def splash
    ip = log_ip
    if session[:user_id] == nil
      flash[:notice] = "Welcome back! Please consider registering to begin your ranting" if ip.visits > 1 && User.find_by(ip_id: ip.id) == nil
      render :splash
    else
      redirect_to rants_path
    end
  end

  def index
    @user = User.find(session[:user_id])
    @my_rants = Rant.where(user_id: session[:user_id])
    @other_rants = Rant.where.not(user_id: session[:user_id])
  end

  def show
    @rant = Rant.find(params[:id])
  end

  def create
    @rant = Rant.new(rant_params)
    @rant.update(user_id: session[:user_id])

    if @rant.save
      flash[:notice] = "Feel better? Rant posted."
      redirect_to rants_path
    else
      flash[:error] = "Yikes.... Unsuccessful Rant :("
      render :index
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    if @rant.user.id == session[:user_id]
      @rant.destroy
      flash[:notice] = "Your rant was deleted."
    end
    redirect_to rants_path
  end

  private

  def rant_params
    params.require(:rant).permit(:subject, :rant)
  end

end