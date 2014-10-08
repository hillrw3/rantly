class FollowersController < ApplicationController

  def index
    @user = session[:user_id]
    @following = Follower.where(user_id: @user)
  end

  def new
    if Follower.find_by(user_id: session[:user_id], following: params[:ranter_id]) == nil
      @follower = Follower.new(user_id: session[:user_id],
                               following: params[:ranter_id]
      )
      if @follower.save
        flash[:notice] = "You're now following #{params[:ranter_name]}"
      end
    else
      flash[:notice] = "You're already following #{params[:ranter_name]}"
    end
    redirect_to :back
  end

  def destroy
    Follower.find_by(user_id: session[:user_id], following: params[:id]).destroy
    redirect_to :back
  end

end