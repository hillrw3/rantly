class Rant < ActiveRecord::Base

  belongs_to :user
  has_many :favorited_rants, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :subject, presence: true, length: {maximum: 50}
  validates :rant, presence: true, length: {minimum: 140}

  def self.flex_search(query)
    Rant.where("rant LIKE :query OR subject LIKE :query", query: "%#{query}%")
  end

  def truncated_rant
    array = self.rant.split(/ /)
    rant = array[0..299].join(' ')
    array.length >= 299 ? rant += '...' : rant
  end

end