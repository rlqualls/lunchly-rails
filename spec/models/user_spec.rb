require 'rails_helper'

RSpec.describe User, :type => :model do
  before :each do
    @user = build(:user)
  end

  it "has a valid factory" do
    expect(@user).to be_valid
  end

  it "has an email" do
    @user.email = ""
    expect(@user).to be_invalid
  end

  it "has a password" do
    @user.password = ""
    expect(@user).to be_invalid
  end
end
