class SearchController < ApplicationController

  def index
    @results = get_results(params[:search])
  end

  private

  def get_results(query)
    users = User.flex_search(query) unless query == nil
    rants = Rant.flex_search(query) unless query == nil
    users + rants
  end

end