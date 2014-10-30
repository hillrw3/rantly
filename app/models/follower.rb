class Follower < ActiveRecord::Base

  belongs_to :follower, class_name: "User", primary_key: :user_id

end