class ConfirmationsController < ApplicationController

  def show
    @user = User.find_by(token: params[:token])

    if @user
      @user.enabled = true
      @user.save!
      flash[:notice] = "Account confirmed!  Get to ranting!"
      render 'sessions/new'
    else
      flash[:error] = "There was an error confirming your account"
      render 'sessions/new'
    end
  end
end