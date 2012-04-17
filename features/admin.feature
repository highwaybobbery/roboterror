Feature: Admin users
   As an administrator
   I want to be able to make other admin users

  Scenario: Create an admin
    Given I am signed in as an admin
    And a user "user@example.com" exists
    When I visit the admin users page
    Then the user "user@example.com" is not an admin
    And I make the user "user@example.com" an admin
    Then the user "user@example.com" is an admin
