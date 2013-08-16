When(/^I click 'add order delivery day' button$/) do
  click_link("add order / delivery day")
end

When(/^select 'Tuesday' from the order day dropdown$/) do
  select("Tuesday", :from => "order_day[day]")
end

When(/^enter (\d+) in the 'delivery duration' input$/) do |arg1|
  fill_in 'order_day[duration]', :with => arg1
end

When(/^click 'save order delivery day'$/) do
  click_button("save order delivery day")
end

Then(/^I should see that 'order delivery day' on the 'edit supplier' page$/) do
  page.should have_content("Update Supplier")
  page.should have_content("Tuesday")
end