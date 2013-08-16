Given(/^I am logged in with a company and supplier$/) do
  login_with_company_and_supplier
end

Given(/^on the edit suppliers page$/) do
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

Given(/^I am logged in with a company and supplier with a product$/) do
  login_with_company_and_supplier_and_product
end

When(/^I click the 'edit' button for the products$/) do
  find(:css, 'table#products_table tr td a.edit_product_btn').click
end

When(/^fill in 'product name' with 'New Product Name'$/) do
  fill_in 'product[name]', :with => 'New Product Name'
end

When(/^I click 'Update Product'$/) do
  click_button("Update Product")
end

Then(/^I should see that new product name on the edit suppliers page$/) do
  page.should have_content("Update Supplier")
  page.should have_content("New Product Name")
end