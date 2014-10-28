require 'carrierwave/orm/activerecord'

class User < ActiveRecord::Base
  has_secure_password

  mount_uploader :avatar, AvatarUploader
  belongs_to :ip
  has_many :rants
  has_many :favorited_rants
  has_many :comments, class_name:  "Comment", foreign_key: :commenter_id
  has_many :spams, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :avatar, presence: true, unless: :admin
  validates :password, length: {minimum: 8}, on: :create


  def self.flex_search(query)
    users = User.where("username LIKE :query OR last_name LIKE :query OR first_name LIKE :query", query: "%#{query}%")
    Rant.where(user_id: users.each {|user| user.id})
  end

  def sorted_rants
    self.rants.sort_by { |r| FavoritedRant.where(rant_id: r.id).count}.reverse
  end

end