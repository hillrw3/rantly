class FavoritedRant < ActiveRecord::Base

  belongs_to :user
  belongs_to :rant

end
