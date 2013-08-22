Feature: View deliveries

  @complete_user
  Scenario: View todays deliveries
    Given I am logged in as a complete user
    And on the deliveries page
    Then the page should say 'Burger Meat'