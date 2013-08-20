Feature: Create an account

  Scenario: Sign Up
    Given I am not a registered user
    And I am on the sign up page
    And I fill in 'user' fields with 'first_name' as 'Jordan'
    And I fill in 'user' fields with 'last_name' as 'Nemrow'
    And I fill in 'user' fields with 'email' as 'nemrowj@gmail.com'
    And I fill in 'user' fields with 'password' as 'password'
    When I click the 'Create Account' button
    Then the page should say 'Welcome to the Meat App Jordan!'

  @blank_user
  Scenario: Log in
    Given I am an existing user
    And I am on the login page
    And I fill in 'user' fields with 'email' as 'nemrowj@gmail.com'
    And I fill in 'user' fields with 'password' as 'password'
    When I click the 'Login' button
    Then the page should say 'Hello Jordan'

  @blank_user
  Scenario: Log out
    Given I am logged in as an existing user
    When I click the 'Signout' link
    Then the page should say 'Login'


