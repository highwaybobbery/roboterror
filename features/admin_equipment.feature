Feature: Admin Equipment Page
  As an Admin
  I want to view all of the equipment in the system
  So that I can manage the equipment

  Scenario: View All Equipment
    Given I am signed in as an admin
    And an equipment exists
    And I visit the admin equipment page
    Then I see the equipment

  Scenario: Delete Equipment
    Given I am signed in as an admin
    And an equipment exists
    And I visit the admin equipment page
    And I see the equipment
    Then I delete the equipment
    And I do not see the equipment
