Given(/^on the order page of my only supplier$/) do
  click_link("Place Orders")
  click_link("Harris Ranch")
  page.should have_content('Order for Harris Ranch')
  p "WIP need to pull orders from today or initiate new ones"
end

When(/^click '(.*)' link$/) do |link|
  click_link(link)
end