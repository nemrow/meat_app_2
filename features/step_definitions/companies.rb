Given(/^my account is not associated to a company$/) do
end

Given(/^I am on the 'create new company' page$/) do
  page.should have_content("Create Company")  
end

Given(/^I fill in the company name$/) do
  fill_in 'company[name]', :with => 'Nemrows Meats'
end

When(/^I click 'add company'$/) do
  click_button("Create Company")
end

Then(/^I shoud be taken to the company page$/) do
  page.should have_content("Nemrows Meats")
end