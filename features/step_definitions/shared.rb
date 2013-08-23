Given(/^I fill in '(.*)' fields with '(.*)' as '(.*)'$/) do |model ,field, value|
  fill_in "#{model}[#{field}]", :with => "#{value}"
end

When(/^I click the '(.*)' button$/) do |value|
  click_button("#{value}")
end

When(/^I click the '(.*)' link$/) do |value|
  click_link("#{value}")
end

Then(/^the page should say '(.*)'$/) do |value|
  page.should have_content("#{value}")
end

Given(/^I am logged in as an existing user$/) do
  login_as_existing_user
end

Then(/^show page$/) do
  save_and_open_page
end

When(/^I fill in the first number input in the '(.*)' form with '(.*)'$/) do |model, value|
  page.find("form.#{model}_form input[type=number]").set(value)
end

Then(/^the first number input in the '(.*)' form should have '(.*)'$/) do |model, value|
  page.find("form.#{model}_form input[type=number]").value.should == value
end

