Feature: Add company to user

  In order to manage inventory
  A user
  Should add a company

  Scenario: Add a company
    Given I am logged in
    And my account is not associated to a company
    And I am on the 'create new company' page
    And I fill in the company name
    When I click 'add company'
    Then I shoud be taken to the company page