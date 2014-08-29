class Rant < ActiveRecord::Base
  belongs_to :user

  validates :subject, presence: true, length: {maximum: 50}
  validates :rant, presence: true, length: {minimum: 140}
end