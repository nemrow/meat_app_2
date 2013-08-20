Feature: Add products
  
  @blank_user @company @supplier
  Scenario: Add product to the supplier
    Given I am logged in as an existing user
    And have an associated company named 'Nemrows Meats'
    And have a supplier attatched to that company named 'Harris Ranch'
    And on the edit suppliers page
    When I click the 'add new product' link
    And I fill in 'product' fields with 'name' as 'Burger Meat'
    And I click the 'save product' button
    Then the page should say 'Burger Meat'