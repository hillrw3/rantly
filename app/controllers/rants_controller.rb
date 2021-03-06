class RantsController < ApplicationController

  def splash
    ip = log_ip
    if current_user == nil
      flash[:notice] = "Welcome back! Please consider registering to begin your ranting" if ip.visits > 1 && User.find_by(ip_id: ip.id) == nil
      render :splash
    else
      if current_user.admin
        redirect_to admins_path
      else
        redirect_to rants_path
      end
    end
  end

  def index
    @my_rants = current_user.rants
    @mentioned_rants = Rant.where_user_mentioned(current_user)
    @other_rants = Rant.all_except_spam_and_current_user(current_user)
  end

  def show
    @rant = Rant.find(params[:id])
    @comment = Comment.new
  end

  def create
    @rant = Rant.new(rant_params)
    @rant.update(user_id: session[:user_id])

    if @rant.save
      Keen.publish(:rants, {user_id: @rant.user_id, date: @rant.created_at}) if Rails.env.production?
      flash[:notice] = "Feel better? Rant posted."
      redirect_to rants_path
    else
      flash[:error] = "Yikes.... Unsuccessful Rant :("
      render :index
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy if @rant.user.id == session[:user_id] || current_user.admin
    flash[:notice] = "Your rant was deleted."
    if current_user.admin
      redirect_to :back
    else
      redirect_to rants_path
    end
  end

  private

  def rant_params
    params.require(:rant).permit(:subject, :rant)
  end

end