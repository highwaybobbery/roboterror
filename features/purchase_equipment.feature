Feature: Purchase Equipment
  As a User
  I want to purchase equipment
  So that I can enjoy building robots

  Scenario: Purchase affordable equipment
    Given I sign in
    And an equipment with stats exists
    When I visit the purchase equipment page
    Then I see the equipment in the list of equipment for sale
    When I purchase the equipment
    Then I have spent credits
    And I see the equipment in my inventory
