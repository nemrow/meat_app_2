Given(/^on the deliveries page$/) do
  visit root_path
  click_link("Deliveries")
  save_and_open_page
end

Then(/^the page should show todays deliveries$/) do
  pending # express the regexp above with the code you wish you had
end