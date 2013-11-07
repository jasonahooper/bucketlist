require 'machinist/active_record'

Destination.blueprint do
  name { Faker::Address.country}
end

Traveller.blueprint do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.first_name }
end
