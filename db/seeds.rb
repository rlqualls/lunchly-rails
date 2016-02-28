# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
Restaurant.destroy_all
User.destroy_all

10.times do
  name = FFaker::Name.name.downcase.gsub(" ", "")
  email = "#{name}@example.com"
  u = FactoryGirl.create(:user, email: email)
  u.save
end

possible_num_ratings = (0..10).to_a
10.times do
  num_ratings = possible_num_ratings.sample
  r = FactoryGirl.create(:restaurant)
  num_ratings.times do
    random_rating = (1..5).to_a.shuffle.first
    user = User.order("RANDOM()").first
    r.ratings.create({ score: random_rating, user_id: user.id })
  end
  r.save
end
