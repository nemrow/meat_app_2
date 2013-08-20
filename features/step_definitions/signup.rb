include CucumberHelper

Given(/^I am not a registered user$/) do
  User.count.should == 0
end

Given(/^I am an existing user$/) do
  User.count.should == 1
end

Given(/^I am on the login page$/) do
  visit login_path
end

Given(/^I am on the sign up page$/) do
  visit new_user_path
end