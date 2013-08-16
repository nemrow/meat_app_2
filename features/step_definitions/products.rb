Given(/^I am logged in with a company and supplier$/) do
  login_with_company_and_supplier
end

Given(/^on that suppliers page$/) do
  page.should have_content('Update Supplier')  
end

When(/^I click 'add product'$/) do
  click_link("add new product")
end

When(/^fill in 'product name' with 'burger meat'$/) do
  fill_in 'product[name]', :with => 'burger meat'
end

When(/^click 'save product'$/) do
  click_button("save product")
end

Then(/^I should see that product on the suppliers edit page$/) do
  page.should have_content("burger meat")
  page.should have_content("Update Supplier")
end