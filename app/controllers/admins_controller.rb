class AdminsController < ApplicationController

  def show
    check_if_admin
    @rants = Rant.order('created_at DESC')
  end

  def rants
    check_if_admin
    @rants = Rant.order('created_at DESC')
  end

  def users
    check_if_admin
    @users = User.all
  end

  private

  def check_if_admin
    unless current_user.admin
      flash[:error] = "You must be an admin to see this page"
      redirect_to "/"
    end
  end

end