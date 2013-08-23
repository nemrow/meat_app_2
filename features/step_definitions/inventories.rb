Given(/^on the inventory page of my only supplier$/) do
  first(:link, "Take Inventory").click
  page.find('h1.page_header').should have_content("Take Inventory")
  click_link("Harris Ranch")
  save_and_open_page
  page.find('h1.page_header').should have_content("Inventory for Harris Ranch")
end

When(/^I fill in the the quantity with (\d+)$/) do |quantity|
  page.find("input[type=number]").set(10)
end