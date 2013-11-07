Feature: Add Destination

  @javascript
  Scenario: A traveller adds a destination
    Given that I am signed in
    And I am on the homepage
    When I add a Destination
    Then I should see my destination appear on the page
