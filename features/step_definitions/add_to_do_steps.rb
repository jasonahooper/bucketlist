Given(/^I have created a Destination$/) do
  step 'I add a Destination'
end

When(/^I add a To\-Do$/) do
  fill_in "ToDo Name", :with => "A Test Todo"
  fill_in "ToDo Image URL", :with => 'http://lorempixel.com/400/200/'
  # fill_in "ToDo Image URL", :with => 'image.jpg'
  fill_in "ToDo Priority", :with => rand(2) + 1
  fill_in "ToDo Where", :with => "A Dummy Place"
  click_button 'Add ToDo'
end

Then(/^I should see my to\-do appear on the page$/) do
  Capybara.default_wait_time = 5
  expect(page).to have_content 'A Test Todo'
end

Given(/^there is a destination "(.*?)"$/) do |dest|
  @dest = Destination.make!(:name => "#{dest}")
end

Given(/^there is a to\-do "(.*?)" with a priority of "(.*?)" for "(.*?)"$/) do
 |to_do, priority, dest|
  ToDo.make!(:name => to_do, :priority => priority,
    :destination_id => Destination.find_by_name(dest).id)
end

When(/^I click on the "(.*?)" link$/) do |link|
  click_link link
end

Then(/^I will see "(.*?)" before "(.*?)"$/) do |first, second|
  assert page.body.index(first) < page.body.index(second)
end