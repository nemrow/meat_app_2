module CucumberHelper
  def sign_out
    visit signout_path
  end

  def login_as_existing_user
    visit root_path
    click_link("Login")
    fill_in "user[email]", :with => 'nemrowj@gmail.com'
    fill_in 'user[password]', :with => 'password'
    click_button("Login")
  end
end