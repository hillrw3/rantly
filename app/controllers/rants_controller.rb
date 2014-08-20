class RantsController < ApplicationController

  def splash

  end

  def index
    @user = User.find(session[:user_id])
  end

end