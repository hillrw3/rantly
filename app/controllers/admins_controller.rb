class AdminsController < ApplicationController

  def show
    @rants = Rant.order('created_at DESC')
  end

end