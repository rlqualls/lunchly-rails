class Rating < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user

  validates :score, inclusion: { in: (0..5), message: "Ratings are 0 to 5" }
end
