@smoke_tests
Feature: Verifications on the authentication page

  Background:
    Given I go the the store homepage

  @authentication
  Scenario: Check if wrong credentials login is signaled properly (various cases)
    Then I click the 'sign in' button
    Then on the Auth page I enter the wrong credentials and look for the errors
      | mail           | pass    | errors                     |
      | mihai.bota     | match   | Invalid email address.     |
      |                | match   | An email address required. |
      | mihaita@gg.com | invalid | Authentication failed.     |
      | mihaita@gg.com |         | Password is required.      |

