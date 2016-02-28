class SiteController < ApplicationController
  def index
    @restaurant = Restaurant.order("RANDOM()").first
  end
end
