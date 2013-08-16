Feature: Add, remove, and edit suppliers order days

  Scenario: Add order_day to supplier
    Given I am logged in with a company and supplier
    And on the edit suppliers page
    When I click 'add order delivery day' button
    And select 'Tuesday' from the order day dropdown
    And enter 3 in the 'delivery duration' input
    And click 'save order delivery day'
    Then I should see that 'order delivery day' on the 'edit supplier' page