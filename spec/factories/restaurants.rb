require_relative "../support/factory_girl/factory_helpers"

FactoryGirl.define do
  factory :restaurant do
    title { "#{FFaker::Name.name}'s #{FFaker::Food.herb_or_spice}" }
    description { "Restaurant Description" }
    address { "#{FFaker::Address.street_address}, City, ST" }
    last_visited { random_time_in_past }
  end
end
