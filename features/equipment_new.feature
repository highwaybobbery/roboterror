Feature: Create a new piece of Equipment
  As an admin
  I want to create new equipment
  So that users can enjoy building robots

  Scenario: Create valid equipment
    Given I am signed in as an admin
    And I visit the admin equipment page
    Then I should be able to create equipment
    And I should see the equipment
