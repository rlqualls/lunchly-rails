class Restaurant < ActiveRecord::Base
  has_many :ratings

  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true

  def self.last_visited
    order("last_visited").last
  end
end
