require 'rails_helper'

RSpec.describe Rating, :type => :model do
  it 'has a valid factory' do
    expect(build(:rating)).to be_valid
  end

  it 'can have a score of 0' do
    rating = build(:rating)
    rating.score = 0
    expect(rating).to be_valid
  end

  it 'can have a score of 5' do
    rating = build(:rating)
    rating.score = 5
    expect(rating).to be_valid
  end

  it 'cannot have a score of -1' do
    rating = build(:rating)
    rating.score = -1
    expect(rating).to be_invalid
  end

  it 'cannot have a score of 6' do
    rating = build(:rating)
    rating.score = 6
    expect(rating).to be_invalid
  end
end
