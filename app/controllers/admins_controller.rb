class AdminsController < ApplicationController
  before_action :check_if_admin

  def show
    @rants = Rant.order('created_at DESC')
  end

  def rants
    @rants = Rant.order('created_at DESC')
  end

  def spam
    @rants = Rant.spam
  end

  def users
    @users = User.where(admin: false).order(:username)
  end

  def disable
    @user = User.find(params[:id])
    disable_user(@user)
  end

  private

  def check_if_admin
    unless current_user.admin
      redirect_to "/"
    end

    def disable_user(user)
      if user.enabled
        user.update_attributes(enabled: false)
        redirect_to :back
      else
        user.update_attributes(enabled: true)
        redirect_to :back
      end
    end
  end

end