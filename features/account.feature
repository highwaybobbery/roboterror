Feature: Accounts are created
  In order to use the application
  As a visitor
  I should be able to create an account, sign in, and sign out

  Scenario: Sign up with new email address
    When I sign up as "user@example.com"
    Then I should be signed in as "user@example.com"

  Scenario: Sign out
    When I sign up as "user@example.com"
    And  I sign out
    Then I should not be signed in

