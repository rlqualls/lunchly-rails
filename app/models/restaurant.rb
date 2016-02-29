class Restaurant < ActiveRecord::Base
  has_many :ratings, dependent: :destroy

  validates :title, presence: true
  validates :address, presence: true

  def self.last_visited
    where("last_visited is not null").order("last_visited").last
  end

  def average_rating
    if ratings.size > 0
      ratings.average(:score).round(1)
    else
      0
    end
  end

  # Returns a restaurant that is weighted for not being visited for
  # a while and being well rated
  def self.whats_for_lunch
    restaurants = order("last_visited").first(5)
    best_rated = restaurants.sort_by(&:average_rating).reverse.first(3)
    return best_rated.sample
  end
end
