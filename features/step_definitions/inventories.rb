Given(/^on the inventory page of my only supplier$/) do
  first(:link, "Take Inventory").click
  page.find('h1.page_header_text').should have_content("Take Inventory")
  click_link("Harris Ranch")
  page.find('h1.page_header_text').should have_content("Inventory for Harris Ranch")
end

When(/^I fill in the the quantity with (\d+)$/) do |quantity|
  page.find("input[type=text]").set(10)
end

Then(/^the page should display (\d+) on the updated page$/) do |quantity|
  page.find("input[type=text]").value.should == '10'
end