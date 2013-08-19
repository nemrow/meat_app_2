Given(/^on the order page of my only supplier$/) do
  click_link("Place Orders")
  click_link("Harris Ranch")
  page.should have_content('Order for Harris Ranch')
end

When(/^click '(.*)' link$/) do |link|
  click_link(link)
end

Given(/^I am logged in with a company and supplier with a product with (\d+) days of orders$/) do |arg1|
  login_as_existing_user
end

Given(/^on on the order page for my supplier$/) do
  click_link("Place Orders")
  click_link("Harris Ranch")
end

Then(/^I should see (\d+) weeks of past orders$/) do |arg1|
  p Order.all
  save_and_open_page
end