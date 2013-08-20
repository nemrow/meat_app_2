Feature: Add, edit, and remove suppliers

  @blank_user @company
  Scenario: Add supplier
    Given I am logged in as an existing user
    And have an associated company named 'Nemrows Meats'
    And and on my suppliers page
    When I click the 'Add Supplier' link
    And I fill in 'supplier' fields with 'name' as 'Harris Ranch'
    When I click the 'Add Supplier' button
    Then the page should say 'Update Supplier'
