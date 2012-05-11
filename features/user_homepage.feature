Feature: User Homepage
  As a User
  I want to view my personal homepage
  So that I can get an overview of my account

  Background:

  Scenario: User Homepage
    Given I sign in
    And a robot exists
    And I create a robot
    And I visit the homepage
    Then I have credits
    And I see a list of my robots
    And I see a list of other robots
