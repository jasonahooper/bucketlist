Feature: Add Destination


  Scenario: A traveller adds a Destination
    Given that I am signed in
    And I am on the homepage
    When I add a Destination
    Then I should see my destination appear on the page
