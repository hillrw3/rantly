class SearchController < ApplicationController

  def index
    @search = params[:search]
  end

end