Given(/^on the deliveries page$/) do
  visit root_path
  click_link("Deliveries")
end

Then(/^the page should show todays deliveries$/) do
  pending # express the regexp above with the code you wish you had
end