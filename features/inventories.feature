Feature: Take and updat inventory

  Scenario: Take inventory
    Given I am logged in with a company, and supplier with 5 products
    And on the inventory page of my only supplier
    When I fill in the the quantities with 10, 20, 30, 40, 50
    And click the 'take inventory' button
    Then the page should display 10, 20, 30, 40, and 50 on the updated page 