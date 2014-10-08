class Rant < ActiveRecord::Base

  belongs_to :user
  has_many :favorited_rants

  validates :subject, presence: true, length: {maximum: 50}
  validates :rant, presence: true, length: {minimum: 140}
end