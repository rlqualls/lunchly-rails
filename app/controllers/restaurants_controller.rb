class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find_by_id params["id"]
  end

  def destroy
    @restaurant = Restaurant.find_by_id params["id"]
    @restaurant.destroy
    redirect_to :back
  end
end
