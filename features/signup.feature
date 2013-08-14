Feature: Create an account
  In order to organize inventory
  A future user
  Should sign up

  Scenario: Sign Up
    Given I am on the sign up page
    And fill in my 'first name' with 'Jordan' 
    And fill in my 'last name' with 'Nemrow'
    And fill in my 'email' with 'nemrowj@gmail.com'
    And fill in a 'password' with 'password'
    When I press 'Create Account'
    Then page should say 'Welcome to the Meat App Jordan'

  Scenario: Log in
    Given I am an existing user
    And I am on the login page
    And I fill in 'email' with 'nemrowj@gmail.com'
    And I fill in 'password' with 'password'
    When I click 'login'
    Then page should say 'Hello Jordan'

  Scenario: Log out
    Given I am logged in
    And I click 'logout'
    Then page should say 'Login'


