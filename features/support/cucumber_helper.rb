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
end