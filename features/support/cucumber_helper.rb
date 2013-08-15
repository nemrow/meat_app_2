module CucumberHelper
  def sign_up
    visit signup_path
    fill_in 'user[first_name]', :with => 'Jordan'
    fill_in 'user[last_name]', :with => 'Nemrow'
    fill_in 'user[email]', :with => 'nemrowj@gmail.com'
    fill_in 'user[password]', :with => 'password'
    click_button 'Create Account'
  end

  def create_company
    fill_in 'company[name]', :with => 'Nemrows Meats'
    click_button 'Create Company'
  end

  def sign_out
    visit signout_path
  end
end