Given(/^have an associated company named '(.*)'$/) do |company|
  User.first.companies.first.name.should == company
end

Given(/^and on my suppliers page$/) do
  click_link("Suppliers")
end