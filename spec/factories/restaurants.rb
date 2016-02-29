require_relative "../support/factory_girl/factory_helpers"

FactoryGirl.define do
  factory :restaurant do
    title { "#{FFaker::Name.first_name}'s #{FFaker::Food.herb_or_spice}" }
    description { "Restaurant Description" }
    address { "#{FFaker::Address.street_address}, City, ST" }
    phone_number { FFaker::PhoneNumber.short_phone_number.gsub(/^.../, "555") }
    last_visited { random_time_in_past }
  end
end
