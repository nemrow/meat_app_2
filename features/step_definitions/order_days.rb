When(/^select '(.*)' from the '(.*)' dropdown$/) do |value, name|
  select(value, :from => name)
end

When(/^I click 'edit' button for order_day row$/) do
  find(:css, 'table#order_days_table tr td a.edit_btn').click
end

When(/^I click 'delete' button for order_day row$/) do
  find(:css, 'table#order_days_table tr td a.delete_btn').click
end

Then(/^page should not show '(.*)'$/) do |value|
  page.should_not have_content(value)
end