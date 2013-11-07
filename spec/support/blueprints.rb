require 'machinist/active_record'

Destination.blueprint do
  name { Faker::Address.country }
  traveller_id { Traveller.make!.id }
end

Traveller.blueprint do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.first_name }
end

ToDo.blueprint do
  name { 'a test todo' }
  image_url { 'image.jpg' }
  priority { rand(99) }
  where { 'a test location' }
  latitude { Faker::Country.Latitude }
  longitude { Faker::Country.Longitude }
  destination_id { Destination.make!.id }
end
