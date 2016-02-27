require 'rails_helper'

RSpec.describe Rating, :type => :model do
  it 'has a valid factory' do
    expect(build(:rating)).to be_valid
  end
end
