class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find_by_id params["id"]
  end

  def edit
    @restaurant = Restaurant.find_by_id params["id"]
  end

  def update
    @restaurant = Restaurant.find_by_id params["id"]
    if @restaurant.update_attributes(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = Restaurant.find_by_id params["id"]
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:title, :description, :phone_number)
  end
end
