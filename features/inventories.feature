Feature: Take and updat inventory

  Scenario: Take inventory
    Given I am logged in with a company and supplier with a product
    And on the inventory page of my only supplier
    When I fill in the the quantity with 10
    And click 'Save Inventory' button
    Then the page should display 10 on the updated page 