class AdminsController < ApplicationController
  before_action :check_if_admin

  def show
    @rants = Rant.order('created_at DESC')
  end

  def rants
    @rants = Rant.order('created_at DESC')
  end

  def users
    @users = User.all
  end

  private

  def check_if_admin
    unless current_user.admin
      redirect_to "/"
    end
  end

end