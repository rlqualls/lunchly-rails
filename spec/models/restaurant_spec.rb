require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  it "has a valid factory" do
    expect(build(:restaurant)).to be_valid
  end
end
