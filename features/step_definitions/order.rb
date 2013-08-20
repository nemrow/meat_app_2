Then(/^I should see the (.*) quantities$/) do |field|
  page.first("table tr td.order_history_#{field}").text.should have_content(/\d+/)
end

Given(/^I am logged in as a complete user$/) do
  login_as_existing_user
  page.should have_content("Hello Jordan")
end

Given(/^on the order page of my supplier$/) do
  click_link("Place Orders")
  click_link("Harris Ranch")
end