class SearchController < ApplicationController

  def index
    @results = get_results(params[:search]) unless params[:search] == nil || params[:search] == ''
  end

  private

  def get_results(query)
    users = User.flex_search(query)
    rants = Rant.flex_search(query)
    users + rants
  end

end