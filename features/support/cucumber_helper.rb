module CucumberHelper
  def sign_up
    visit signup_path
    fill_in 'user[first_name]', :with => 'Jordan'
    fill_in 'user[last_name]', :with => 'Nemrow'
    fill_in 'user[email]', :with => 'nemrowj@gmail.com'
    fill_in 'user[password]', :with => 'password'
    click_button 'Create Account'
  end

  def login_with_company_and_supplier
    sign_up
    create_company
    click_link("Suppliers")
    add_supplier
  end

  def login_with_company_and_supplier_and_product
    login_with_company_and_supplier
    click_link("add new product")
    fill_in 'product[name]', :with => 'Burger Meat'
    click_button("save product")
  end

  def login_with_company_and_supplier_order_day
    login_with_company_and_supplier
    click_link("add order / delivery day")
    select('Thursday', :from => "order_day[day]")
    fill_in 'order_day[duration]', :with => 1
    click_button("save order delivery day")
  end

  def create_company
    fill_in 'company[name]', :with => 'Nemrows Meats'
    click_button 'Create Company'
  end

  def add_supplier
    click_link("Add Supplier")
    fill_in 'supplier[name]', :with => 'Harris Ranch'
    click_button('Add Supplier')
  end

  def sign_out
    visit signout_path
  end

  def add_order_day(day, duration, supplier)
    OrderDay.create(:day => day, :duration => duration, :supplier_id => supplier.id)
  end

  def create_month_of_orders(product, supplier, company, duration)
    4.times do |week|
      order_date = date_formatted(Time.now - (7*week).days)
      delivery_date = date_formatted((Time.now - (7*week).days) - duration.days)
      Order.create( :quantity  => Random.rand(10..100),
                    :order_date_string => order_date,
                    :delivery_date_string => delivery_date,
                    :product_id => product.id,
                    :supplier_id => supplier.id,
                    :company_id => company.id
                  )
    end
  end

  def create_month_of_inventories(product, supplier, company)
    4.times do |week|
      date = date_formatted(Time.now - week.weeks)
      Inventory.create( :quantity => Random.rand(10..100),
                        :date_string => date,
                        :product_id => product.id,
                        :supplier_id => supplier.id,
                        :company_id => company.id
                      )
    end
  end

  def login_as_existing_user
    visit root_path
    click_link("Login")
    fill_in "user[email]", :with => 'nemrowj@gmail.com'
    fill_in 'user[password]', :with => 'password'
    click_button("Login")
  end
end