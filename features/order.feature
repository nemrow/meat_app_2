Feature: Place and view orders

  @complete_user
  Scenario: Place Order
    Given I am logged in as a complete user
    And on the order page of my supplier
    When I fill in the the quantity with 10
    And I click the 'Save Order' button
    Then the page should display 10 on the updated page

  @complete_user  
  Scenario: View past order quantities
    Given I am logged in as a complete user
    And on the order page of my supplier
    Then I should see the order quantities

  @complete_user
  Scenario: View past inventory quantities
    Given I am logged in as a complete user
    And on the order page of my supplier
    Then I should see the inventory quantities

  @complete_user
  Scenario: View past in transit orders quantities
    Given I am logged in as a complete user
    And on the order page of my supplier
    Then I should see the in_transit quantities
