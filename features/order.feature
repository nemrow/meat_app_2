Feature: Place and update orders

  Scenario: place order
    Given I am logged in with a company and supplier with a product
    And on the order page of my only supplier
    When I fill in the the quantity with 10
    And click 'Save Order' button
    Then the page should display 10 on the updated page 