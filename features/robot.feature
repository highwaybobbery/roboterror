Feature: As a user
  In order to manage my robot fleet
  I should be able to add, edit and delete robots

  Background:
    Given I sign in
    And I create a robot

  Scenario: Create a robot
    Then I see the robot configuration page
    When I visit the homepage
    Then  I see the robot

  Scenario: Edit a robot
    Then I see the robot configuration page
    When I visit the homepage
    Then I edit the robot

  Scenario: Delete a robot
    Then I see the robot configuration page
    When I visit the homepage
    Then I delete the robot

  Scenario: View a robot
    Then I see the robot configuration page
    When I visit the homepage
    Then I view the robot
