class FavoritedRantsController < ApplicationController

  def index
    @favorite_rants = []
    FavoritedRant.where(user_id: session[:user_id]).each do |favorite|
      @favorite_rants << Rant.find(favorite.rant_id)
    end
    @favorite_rants
  end

  def new
    @rant = FavoritedRant.new(user_id: session[:user_id], rant_id: params[:rant_id])

    if @rant.save
      flash[:notice] = "Rant favorited"
      redirect_to :back
    else
      flash[:error] = "Uh oh... There was a problem favoriting that rant"
      render "rants/index"
    end
  end

end