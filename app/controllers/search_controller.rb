class SearchController < ApplicationController

  def index
    @results = get_results(params[:search])
  end


  private

  def get_results(query)
    results = []
    if params[:search] == nil
      nil
    else
      users = []
      users << User.find_by(last_name: query)
      users << User.find_by(first_name: query)
      users << User.find_by(username: query)
      users.map { |user| user.rants}
      p users
      results << users
    end
    results
  end

end