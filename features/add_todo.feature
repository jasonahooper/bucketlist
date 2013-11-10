Feature: Add ToDo

  @javascript
  Scenario: A traveller adds a To-Do
    Given that I am signed in
    And I am on the homepage
    And I have created a Destination
    And I am on the homepage
    When I add a To-Do
    Then I should see my to-do appear on the page

  @javascript
  Scenario: A traveller sorts To-Dos by priority
    Given that I am signed in
    And there is a destination "South Africa"
    And there is a to-do "test-1" with a priority of "2" for "South Africa"
    And there is a to-do "test-2" with a priority of "1" for "South Africa"
    And I am on the homepage
    When I click on the "Priority" link
    Then I will see "test-2" before "test-1"
    When I click on the "ToDo" link
    Then I will see "test-1" before "test-2"
    When I click on the "Recent" link
    Then I will see "test-2" before "test-1"
