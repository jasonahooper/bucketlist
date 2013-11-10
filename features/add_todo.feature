Feature: Add ToDo

  @javascript
  Scenario: A traveller adds a To-Do
    Given that I am signed in
    And I am on the homepage
    And I have created a Destination
    And I am on the homepage
    When I add a To-Do
    Then I should see my to-do appear on the page
