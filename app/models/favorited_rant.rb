class FavoritedRant < ActiveRecord::Base

  has_one :user
  has_one :rant

end
