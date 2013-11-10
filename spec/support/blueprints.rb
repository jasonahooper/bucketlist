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
  where { 'a test location' }
  destination_id { Destination.make!.id }
end

ToDo.blueprint(:low) do
  priority { 3 }
end

ToDo.blueprint(:high) do
  priority { 1 }
end
