class SiteController < ApplicationController
  def index
    @restaurant = Restaurant.whats_for_lunch
  end
end
