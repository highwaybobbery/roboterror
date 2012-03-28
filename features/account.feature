Feature: Accounts are created
  In order to use the application
  As a visitor
  I should be able to create an account

  Scenario: Sign up with new email address
    When I sign up as "user@example.com"
    Then I should be logged in

  Scenario: Cannot sign up with duplicate email address
    Given the following user exists
      |email           |
      |user@examle.com |
    When I sign up as "user@example.com"
    Then I should not be logged in
    And  I should see an error
