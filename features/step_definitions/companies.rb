Given(/^my account is not associated to a company$/) do
  User.last.companies.count.should == 0
end

Given(/^I am on the 'create new company' page$/) do
  page.should have_content("Create Company")  
end