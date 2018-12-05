@smoke_tests
Feature: Verifications on the authentication page

  Background:
    Given I go to the my account page

  @authentication
  Scenario: Check if registration info for a demo account is changed, the data is saved correctly
    When I log in with a demo account
    And I go to the my personal information page
    And I store my demo account information data
    And I change the information of my account
    Then Saving the changes is possible and succeds
    When I go to the my personal information page
    Then The changes should be applied
    Then I succesfully change back the demo account information