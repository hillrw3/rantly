class SearchController < ApplicationController

  def index
    if params[:search] == nil
      @result = nil
    else
      @result = User.find_by(last_name: params[:search])
    end
  end

end