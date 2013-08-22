include ApplicationHelper
include CucumberHelper

Before('@complete_user') do
  # create user
  @user = User.create(:first_name => 'Jordan',
                      :last_name => 'Nemrow',
                      :email => 'nemrowj@gmail.com',
                      :password => 'password'
                      )

  # add company to user
  @company = Company.create(:name => 'Nemrows Meats')
  @user.companies << @company

  # add supplier to user and company
  @supplier = Supplier.create(:name => 'Harris Ranch', :company_id => @company.id)
  @company.suppliers << @supplier

  # add product to supplier
  @product = Product.create(:name => 'Burger Meat', :supplier_id => @supplier.id)
  @supplier.products << @product

  # add order_days to supplier
  order_day_1 = day_of_week(Time.now)
  order_day_2 = day_of_week(Time.now - 2.days)
  order_day_3 = day_of_week(Time.now - 4.days)
  @supplier.order_days << OrderDay.create(:day => order_day_1, :duration => 4)
  @supplier.order_days << OrderDay.create(:day => order_day_2, :duration => 4)
  @supplier.order_days << OrderDay.create(:day => order_day_3, :duration => 4)

  # add 60 days of orders
  60.times do |num|
    if [order_day_1, order_day_2, order_day_3].include?(day_of_week(Time.now - num.days))
      order = Order.create( :quantity => Random.rand(10..100), 
                            :product_id => @product.id,
                            :order_date_string => date_formatted(Time.now - num.days),
                            :delivery_date_string => date_formatted((Time.now - num.days)+4.days)
                          )
      @supplier.orders << order
      @product.orders << order
      @company.orders << order
    end
  end

  # add 60 days of inventory
  60.times do |num|
    inventory = Inventory.create( :quantity => Random.rand(10..100), 
                              :product_id => @product.id,
                              :date_string => date_formatted(Time.now - num.days)
                            )
    @supplier.inventories << inventory
    @product.inventories << inventory
    @company.inventories << inventory
  end
end

Before('@blank_user') do
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
  @supplier = Supplier.create(:name => 'Harris Ranch')
  @company.suppliers << @supplier
end

Before('@product') do
  @product = Product.create(:name => 'Burger Meat')
  @supplier.products << @product
end