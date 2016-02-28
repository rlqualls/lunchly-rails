require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  before :each do
    @restaurant = build(:restaurant)
  end

  it "has a valid factory" do
    expect(@restaurant).to be_valid
  end

  it "has a title" do
    @restaurant.title = ""
    expect(@restaurant).to be_invalid
  end

  it "has a description" do
    @restaurant.description = ""
    expect(@restaurant).to be_invalid
  end

  it "has an address" do
    @restaurant.address = ""
    expect(@restaurant).to be_invalid
  end

  it "keeps track of last visited" do
    oldy = build(:restaurant)
    oldy.last_visited = 10.days.ago
    oldy.save

    newy = build(:restaurant)
    newy.last_visited = 9.days.ago
    newy.save
    expect(Restaurant.last_visited).to eq newy

    newy.last_visited = 11.days.ago
    newy.save
    expect(Restaurant.last_visited).to eq oldy
  end
end
