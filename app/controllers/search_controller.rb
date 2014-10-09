class SearchController < ApplicationController

  def index

    @results = get_results(params[:search])
  end


  private

  def get_results(query)
    if params[:search] == nil
      nil
    else
      User.find_by(last_name: query).rants
    end
  end

end