class Restaurant < ActiveRecord::Base
  has_many :ratings, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true

  def self.last_visited
    where("last_visited is not null").order("last_visited").last
  end

  def average_rating
    if ratings.size > 0
      ratings.average(:score).round(1)
    else
      'no ratings'
    end
  end
end
