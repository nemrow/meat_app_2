Feature: Add, remove, and edit suppliers order days

  Scenario: Add order_day to supplier
    Given I am logged in with a company and supplier
    And on the edit suppliers page
    When I click 'add order delivery day' button
    And select 'Tuesday' from the order day dropdown
    And enter 3 in the 'delivery duration' input
    And click 'save order delivery day'
    Then I should see that 'Tuesday' on the 'edit supplier' page

  Scenario: Edit an order_day
    Given I am logged in with a company and supplier with order_day
    And on the edit suppliers page
    When I click 'edit' button for order_day row
    And select 'Wednesday' from the order day dropdown
    And enter 3 in the 'delivery duration' input
    And click 'update order delivery day' button
    Then I should see that 'Wednesday' on the 'edit supplier' page

  Scenario: Delete an order_day
    Given I am logged in with a company and supplier with order_day
    And on the edit suppliers page
    When I click 'delete' button for order_day row
    Then I should not see any order days on the supplier page