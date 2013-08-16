Feature: Add, remove and edit products
  
  Scenario: Add product to the supplier
    Given I am logged in with a company and supplier
    And on the edit suppliers page
    When I click 'add product'
    And fill in 'product name' with 'burger meat'
    And click 'save product'
    Then I should see that product on the suppliers edit page

  Scenario: Edit product
    Given I am logged in with a company and supplier with a product
    And on the edit suppliers page
    When I click the 'edit' button for the products
    And fill in 'product name' with 'New Product Name'
    And I click 'Update Product'
    Then I should see that new product name on the edit suppliers page 