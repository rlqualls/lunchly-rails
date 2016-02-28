FactoryGirl.define do
  factory :restaurant do
    title { "#{FFaker::Name.name}'s #{FFaker::Food.herb_or_spice}" }
    description { "Restaurant Description" }
    address { "#{FFaker::Address.street_address}, City, ST" }
  end
end
