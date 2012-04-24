Feature: Purchase Equipment
  As a User
  I want to purchase equipment
  So that I can enjoy building robots

  Scenario: Purchase affordable equipment
    Given I sign in
    And there is a "Generic Death Claw" equipment for "250"
    Then I should have "1000" credits
    When I visit the purchase equipment page
    Then I should see the "Generic Death Claw" in the list of equipment for sale
    When I purchase the "Generic Death Claw"
    Then I should have "750" credits
    And I should see "Generic Death Claw" in my inventory
