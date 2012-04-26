Feature: Sign out

  In order to protect my account from unauthorized access
  As a signed in user
  I want to sign out

  Scenario: User signs out
    Given I am signed up as "email@example.com"
    When I sign in as "email@example.com"
    Then I am signed in
    When I sign out
    Then I am signed out
