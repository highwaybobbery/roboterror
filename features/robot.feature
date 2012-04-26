Feature: As a user
  In order to manage my robot fleet
  I should be able to add, edit and delete robots

  Scenario: Create a robot
    Given I sign in
    And I create a robot
    Then  I see the robot

  Scenario: Edit a robot
    Given I sign in
    And I create a robot
    Then I edit the robot

  Scenario: Delete a robot
   Given I sign in
   And I create a robot
   Then I delete the robot

  Scenario: View a robot
    Given I sign in
    And I create a robot
    Then I view the robot
