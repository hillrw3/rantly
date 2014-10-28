class SpamController < ApplicationController

  def create
    @spam = Spam.new(rant_id: params[:id], user_id: current_user.id)
    @spam.save
    redirect_to rants_path
  end

end