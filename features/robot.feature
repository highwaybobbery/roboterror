Feature: As a user
  In order to manage my robot fleet
  I should be able to add, edit and delete robots

  Scenario: Create a robot
    I should be able to create new robots
    Given I sign in
    And I create a robot named "Robbie"
    Then  I should see the robot "Robbie" on my homepage

  Scenario: Edit a robot
    I should be able to edit my robot

    Given I sign in
    And I create a robot named "Robbie"
    Then I should be able to edit "Robbie"

  Scenario: Delete a robot
    I should be able to delete my robot

   Given I sign in
   And I create a robot named "Robbie"
   Then I should be able to delete "Robbie"

  Scenario: View a robot
    I should be able to view my robots

    Given I sign in
    And I create a robot named "Robbie"
    Then I should be able to view "Robbie"
