class Restaurant < ActiveRecord::Base
  has_many :ratings, dependent: :destroy

  validates :title, presence: true
  validates :address, presence: true

  def visit!
    update(last_visited: Time.zone.now)
  end

  def self.last_visited
    where("last_visited is not null").order("last_visited").last
  end

  def average_rating
    if self.ratings.size > 0
      self.ratings.average(:score).round(1)
    else
      0
    end
  end

  # Returns a restaurant that is weighted for not being visited for
  # a while and being well rated. The idea is to avoid visiting
  # low-rated restaurants until they have not been visited for a while
  def self.whats_for_lunch
    half_of_restaurants = self.count / 2
    best_rated_amount = (half_of_restaurants / 1.5).round(0)
    restaurants = order("last_visited").first(half_of_restaurants)
    best_rated = restaurants.sort_by(&:average_rating).reverse.first(best_rated_amount)
    return best_rated.sample
  end
end
