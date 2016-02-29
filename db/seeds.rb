NUM_USERS = 10
NUM_RESTAURANTS = 20

Restaurant.destroy_all
User.destroy_all

# Google Places provides information for real places
# places_key = ENV["google_places_api_key"]
# places_client = GooglePlaces::Client.new ENV["google_places_api_key"]
# lat = 33.7878952
# lng = -84.3853487
#
# spots = places_client.spots(lat, lng, types: ["restaurant", "food"])
#
# places = spots.map do |spot|
#   details_url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{spot.place_id}&key=#{places_key}"
#   details_body = HTTParty.get(details_url).body
#   details_json = ActiveSupport::JSON.decode details_body
#   byebug
#   if details_json
#     details = details_json["result"]
#     if details
#       {
#         title: spot.name,
#         address: details["formatted_address"],
#         phone_number: details["formatted_phone_number"]
#       }
#     else
#       {}
#     end
#   else
#     {}
#   end
# end

NUM_USERS.times do
  name = FFaker::Name.name.downcase.gsub(" ", "")
  email = "#{name}@example.com"
  u = FactoryGirl.create(:user, email: email)
  u.save
end

NUM_RESTAURANTS.times do
  num_ratings = rand(20) + 10
  r = FactoryGirl.create(:restaurant)

  num_ratings.times do
    random_rating = (1..5).to_a.shuffle.first
    user = User.order("RANDOM()").first
    r.ratings.create({ score: random_rating, user_id: user.id })
  end
  r.save
end
