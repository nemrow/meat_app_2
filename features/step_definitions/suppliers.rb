Given(/^am associated to a company$/) do
  create_company
end

Given(/^and on my suppliers page$/) do
  click_link("Suppliers")
end

When(/^I click 'add a supplier'$/) do
  click_link("Add Supplier")
end

When(/^fill in the suppliers name$/) do
  fill_in 'supplier[name]', :with => 'Harris Ranch'
end

When(/^I click 'Save Supplier'$/) do
  click_button('Add Supplier')
end

Then(/^I am taken to the 'add order \/ delivery day pages'$/) do
  page.should have_content("Update Supplier")
end