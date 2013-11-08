Given(/^that I am signed in$/) do
  @traveller = Traveller.make!
end

Given(/^I am on the homepage$/) do
  visit root_path
end

When(/^I add a Destination$/) do
  @country = Faker::Address.country
  fill_in 'Destination Name', :with => @country
  fill_in 'Destination Image URL', :with => 'http://lorempixel.com/400/200/'
  click_button 'Add Destination'
end

Then(/^I should see my destination appear on the page$/) do
  expect(page).to have_content @country
end