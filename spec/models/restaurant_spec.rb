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
end
