class Comment < ActiveRecord::Base

  belongs_to :rant
  belongs_to :commenter, class_name: "User"
end
