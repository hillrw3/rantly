class RantsController < ApplicationController

  def splash

  end

  def index
    @user = User.find(session[:user_id])
    @rant = Rant.new
    @my_rants = Rant.where(user_id: session[:user_id])
    @other_rants = Rant.where.not(user_id: session[:user_id])
  end

  def create
    @rant = Rant.new(subject: params[:rant][:subject],
                     rant: params[:rant][:rant],
                     user_id: session[:user_id]
    )

    if @rant.save
      flash[:notice] = "Feel better? Rant posted."
      redirect_to rants_path
    else
      flash[:notice] = "Yikes.... Unsuccessful Rant :("
      render :index
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy
    flash[:notice] = "Your rant was deleted."
    redirect_to rants_path
  end

end