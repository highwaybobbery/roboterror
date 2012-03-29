Feature: Create a new robot
  As a user
  I want to create a new robot
  So that I can begin interacting with the game environment

  Scenario: Create a robot

    Given I am signed in as "user@exmaple.com"
    Then I should be able to create a robot
    And I should see the robot on my hompage
