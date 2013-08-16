When(/^I click 'add order delivery day' button$/) do
  click_link("add order / delivery day")
end

When(/^select '(\w+)' from the order day dropdown$/) do |day|
  select(day, :from => "order_day[day]")
end

When(/^enter (\d+) in the 'delivery duration' input$/) do |arg1|
  fill_in 'order_day[duration]', :with => arg1
end

When(/^click 'save order delivery day'$/) do
  click_button("save order delivery day")
end

Then(/^I should see that '(\w+)' on the '(.*)' page$/) do |day, page_title|
  page.should have_content("Update Supplier")
  page.should have_content(day)
end

Given(/^I am logged in with a company and supplier with order_day$/) do
  login_with_company_and_supplier_order_day
end

When(/^I click 'edit' button for order_day row$/) do
  find(:css, 'table#order_days_table tr td a.edit_btn').click
end

When(/^click '(.*)' button$/) do |button|
  click_button(button)
end

When(/^save and open page$/) do
  save_and_open_page
end

When(/^I click 'delete' button for order_day row$/) do
  find(:css, 'table#order_days_table tr td a.delete_btn').click
end

Then(/^I should not see any order days on the supplier page$/) do
  page.should_not have_content("Thursday")
end