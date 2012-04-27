Feature: Add Stats to Equipment
  As an Admin
  I want to add new stats to a piece of equipment
  So that is has a value in the game

  @javascript
  Scenario: Add Stats to a Feature
    Given I am signed in as an admin
    And an equipment exists
    And I visit the admin equipment stats page
    Then I add stats to the equipment
    And I see the equipment with an updated price
