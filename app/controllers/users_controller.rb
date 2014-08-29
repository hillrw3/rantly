class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(username: params[:user][:username],
                     password: params[:user][:password],
                     first_name: params[:user][:first_name],
                     last_name: params[:user][:last_name],
                     bio: params[:user][:bio],
                     rant_frequency: params[:user][:rant_frequency]
    )

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
    @user.update(username: params[:user][:username],
                 password: params[:user][:password],
                 first_name: params[:user][:first_name],
                 last_name: params[:user][:last_name],
                 bio: params[:user][:bio],
                 rant_frequency: params[:user][:rant_frequency]
    )

    if @user.save
      flash[:notice] = "Your info has been updated!"
      redirect_to rants_path
    else
      render :edit
    end
  end

end