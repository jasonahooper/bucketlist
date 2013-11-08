Given(/^I have created a Destination$/) do
  step 'I add a Destination'
end

When(/^I add a To\-Do$/) do
  fill_in "ToDo Name", :with => "A Test Todo"
  fill_in "ToDo Image URL", :with => 'http://lorempixel.com/400/200/'
  # fill_in "ToDo Image URL", :with => 'image.jpg'
  fill_in "ToDo Priority", :with => rand(99)
  fill_in "ToDo Where", :with => "A Dummy Place"
  fill_in "ToDo Latitude", :with => Faker::Address.latitude
  fill_in "ToDo Longitude", :with => Faker::Address.longitude
  click_button 'Add ToDo'
end

Then(/^I should see my to\-do appear on the page$/) do
  expect(page).to have_content 'A Test Todo'
end