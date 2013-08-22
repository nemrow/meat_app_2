Given(/^have a supplier attatched to that company named '(.*)'$/) do |supplier|
  Company.last.suppliers.first.name.should == supplier
end

Given(/^on the edit suppliers page$/) do
  click_link('Suppliers')
  click_link('Harris Ranch')
  click_link('edit supplier')
  page.should have_content('Update Harris Ranch')
end