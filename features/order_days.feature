Feature: Add suppliers order_days

  @blank_user @company @supplier
  Scenario: Add order_day to supplier
    Given I am logged in as an existing user
    And have an associated company named 'Nemrows Meats'
    And have a supplier attatched to that company named 'Harris Ranch'
    And on the edit suppliers page
    When I click the 'add order / delivery day' link
    And select 'Tuesday' from the 'order_day[day]' dropdown
    And I fill in 'order_day' fields with 'duration' as '3'
    And I click the 'save order delivery day' button
    Then the page should say 'Tuesday'