@smoke_tests
Feature: Verifications on the authentication page

  Background:
    Given I go the the store homepage

#   ====== Checks various login errors ====== Ex 1
 @authentication
  Scenario: Check if wrong credentials login is signaled properly (various cases)
    Then I click the 'sign in' button
    When I enter the mihai.bota mail adress in the email field
    And I enter the pass password in the password field
    And I click the "Sign in" button on the Authentification page
    Then The Invalid email address. error should be displayed

#   ====== Checks various login errors ====== Ex 1
@authentication
Scenario: Check if wrong credentials login is signaled properly (various cases)
Then I click the 'sign in' button
Then on the Auth page I enter the wrong credentials and look for the errors
| mail           | pass      | errors                     |
| mihai.bota     | match     | Invalid email address.     |
|                | match     | An email address required. |
| mihaita@gg.com | invalid   | Authentication failed.     |
| mihaita@gg.com |           | Password is required.      |