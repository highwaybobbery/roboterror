Feature: As a User
  I want to configure my robot
  So that it can engage in combat

  Background:
    Given I sign in
    And an equipment exists
    And I own the equipment

  Scenario: View New Robot
    And I create a robot
    Then I see the robot configuration page
    And I see default robot statistics
    And I see empty equipment slots
    And I see my inventory

  Scenario: Attach and detach equipment
    And I create a robot
    Then I see the equipment in my inventory
    And I add the equipment to my robot
    Then I see the equipment on my robot
    And I see updated robot statistics
    And I do not see the equipment in my inventory
    And I cannot add another equipment of the same type
    Then I detach the equipment
    And I do not see the equipment on my robot
    And I see default robot statistics
    And I see the equipment in my inventory
