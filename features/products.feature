Feature: Add, remove and edit products
  
  Scenario: Add product to the supplier
    Given I am logged in with a company and supplier
    And on that suppliers page
    When I click 'add product'
    And fill in 'product name' with 'burger meat'
    And click 'save product'
    Then I should see that product on the suppliers edit page