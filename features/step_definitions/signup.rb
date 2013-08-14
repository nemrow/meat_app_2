include CucumberHelper

Given(/^I am on the sign up page$/) do
  visit new_user_path
end

Given(/^fill in my 'first name' with 'Jordan'$/) do
  fill_in 'user[first_name]', :with => 'Jordan'
end

Given(/^fill in my 'last name' with 'Nemrow'$/) do
  fill_in 'user[last_name]', :with => 'Nemrow'
end

Given(/^fill in my 'email' with 'nemrowj@gmail\.com'$/) do
  fill_in 'user[email]', :with => 'nemrowj@gmail.com'
end

Given(/^fill in a 'password' with 'password'$/) do
  fill_in 'user[password]', :with => 'password'
end

When(/^I press 'Create Account'$/) do
  click_button 'Create Account'
end

Then(/^page should say 'Welcome to the Meat App Jordan'$/) do
  page.should have_content("Welcome to the Meat App Jordan!")
end

Given(/^I am an existing user$/) do
  sign_up
  sign_out
end

Given(/^I am on the login page$/) do
  visit login_path
end

Given(/^I fill in 'email' with 'nemrowj@gmail\.com'$/) do
  fill_in 'user[email]', :with => 'nemrowj@gmail.com'
end

Given(/^I fill in 'password' with 'password'$/) do
  fill_in 'user[password]', :with => 'password'
end

When(/^I click 'login'$/) do
  click_button 'Login'
end

Then(/^page should say 'Hello Jordan'$/) do
  page.should have_content("Hello Jordan")
end

Given(/^I am logged in$/) do
  sign_up
end

Given(/^I click 'logout'$/) do
  click_link("Signout")
end

Then(/^page should say 'Login'$/) do
  page.should have_content("Sign Up")
end