Feature: Add company to user

  @blank_user
  Scenario: Add a company
    Given I am logged in as an existing user
    And my account is not associated to a company
    And the page should say 'Create Company'
    And I fill in 'company' fields with 'name' as 'Nemrows Meats'
    When I click the 'Create Company' button
    Then the page should say 'Nemrows Meats'