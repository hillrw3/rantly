class Rant < ActiveRecord::Base

  belongs_to :user
  has_many :favorited_rants, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :spams, dependent: :destroy


  validates :subject, presence: true, length: {maximum: 50}
  validates :rant, presence: true, length: {minimum: 140}

  def self.flex_search(query)
    Rant.where("rant LIKE :query OR subject LIKE :query", query: "%#{query}%")
  end

  def rant_to_array
    self.rant.split(/ /)
  end

  def truncated_rant
    array = rant_to_array
    rant = array[0..299].join(' ')
    array.length >= 299 ? rant += '...' : rant
  end

  def self.where_user_mentioned(user)
    mentioned_rants = []
    Rant.all.map do |rant|
      mentioned_rants << rant if rant.rant.include? "@#{user.username}"
    end
    mentioned_rants
  end

  def self.all_except_spam_and_current_user(current_user)
    nonspam_rants = []
    Rant.all.map do |rant|
      nonspam_rants << rant unless Spam.find_by(rant_id: rant.id, user_id: current_user.id) || rant.user_id == current_user.id
    end
    nonspam_rants
  end

  def self.spam
    spam_rant_ids = Spam.all.map {|spam| spam.rant_id }
    Rant.where(id: spam_rant_ids.each {|id| id})
  end

end