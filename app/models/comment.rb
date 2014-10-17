class Comment < ActiveRecord::Base

  belongs_to :rant
  belongs_to :user, class_name: "User"
end
