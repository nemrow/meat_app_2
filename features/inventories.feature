Feature: Take Inventory

  @blank_user @company @supplier @product
  Scenario: Take Inventory
    Given I am logged in as an existing user
    And have an associated company named 'Nemrows Meats'
    And have a supplier attatched to that company named 'Harris Ranch'
    And on the inventory page of my only supplier
    When I fill in the first text input in the 'inventory' form with '10'
    And I click the 'Save Inventory' button
    Then the first text input in the 'inventory' form should have '10'