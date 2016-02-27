require 'rails_helper'

RSpec.describe Rating, :type => :model do
  before :each do
    @rating = build(:rating)
  end

  it 'has a valid factory' do
    expect(@rating).to be_valid
  end

  it 'can have a score of 0' do
    @rating.score = 0
    expect(@rating).to be_valid
  end

  it 'can have a score of 5' do
    @rating.score = 5
    expect(@rating).to be_valid
  end

  it 'cannot have a score of -1' do
    @rating.score = -1
    expect(@rating).to be_invalid
  end

  it 'cannot have a score of 6' do
    @rating.score = 6
    expect(@rating).to be_invalid
  end
end
