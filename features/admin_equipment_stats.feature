Feature: Manage Equipment Stats
  As an Admin
  I want to modify the stats for a piece of equipment
  So that is has a value in the game

  @javascript
  Scenario: Add Stats to an Equipment
    Given I am signed in as an admin
    And an equipment exists
    And I visit the admin equipment stats page
    Then I see the equipment stats page
    And I add stats to the equipment
    Then I see the equipment with an updated price

  Scenario: Edit Equipment that has Stats
    Given I am signed in as an admin
    And an equipment with stats exists
    And I visit the admin equipment stats page
    Then I see the equipment stats page
    And I see the equipment stats

  @javascript
  Scenario: Remove an Equipment Stat
    Given I am signed in as an admin
    Given an equipment with stats exists
    And I visit the admin equipment stats page
    And I remove the equipment stat
    Then the equipment should have no stats
