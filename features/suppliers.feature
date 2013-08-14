Feature: Add, edit, and remove suppliers
  Scenario: Add supplier
    Given I am logged in
    And and on my suppliers page
    When I click 'add a supplier'
    And fill in the suppliers name
    When I click 'Save Supplier'
    Then I am taken to the 'add order / delivery day pages'