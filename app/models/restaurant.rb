class Restaurant < ActiveRecord::Base
  has_many :ratings

  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
end
