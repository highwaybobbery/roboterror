Feature: User Homepage
  As a User
  I want to view my personal homepage
  So that I can get an overview of my account

  Scenario: User Homepage
  Given I sign in
  And I create a robot
  And I visit the homepage
  And a robot exists
  Then I have credits
  And I see a list of my robots
  And I see a list of other robots
