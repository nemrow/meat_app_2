include ApplicationHelper
include CucumberHelper

Before('@user') do
  @user = User.create(:first_name => 'Jordan',
                      :last_name => 'Nemrow',
                      :email => 'nemrowj@gmail.com',
                      :password => 'password'
                      )
end

Before('@company') do
  @company = Company.create(:name => 'Nemrows Meats')
  @user.companies << @company
end

Before('@supplier') do
  @supplier = Supplier.create(:name => 'Harris Ranch', :company_id => @company.id)
end

Before('@product') do
  @product = Product.create(:name => 'Burger Meat', :supplier_id => @supplier.id)
end

Before('@order_day') do
  add_order_day(day_of_week(Time.now), 3, @supplier)
end

Before('@orders') do
  create_month_of_orders(@product, @supplier, @company, 3)
  create_month_of_inventories(@product, @supplier, @company)
end