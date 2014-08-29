class FollowersController < ApplicationController

  def index
    @user = session[:user_id]
    following_ids = Follower.where(user_id: @user)
    @following = []
    if following_ids.class == nil
      @following << "Go find someone to follow."
    elsif following_ids.class == Fixnum
      @following << User.find(following_ids.following).username
    else
      following_ids.each do |following|
        User.where(id: following.following).each { |user| @following << user }
      end
    end
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