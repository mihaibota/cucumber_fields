@smoke_tests
Feature: Verifications on the authentication page

  Background:
    Given I log in with the demo account

  @authentication
  Scenario Outline: Check if registration info for a demo account is changed, the data is saved correctly
    When I go to the my personal information page
    And I change the <gender>, <first_name>, <last_name>, <mail_adress>, <date>, <password>, <news_opt>, <optin_opt> of my account
    Then Saving the changed account information
    When I go to the my personal information page
    Then The changes should be applied
    Then I succesfully change back the demo account information
    Examples:
      | gender | first_name    | last_name | mail_adress             | date      | password   | news_opt | optin_opt |
      | female | San Francisco | Hernandez | frodo.baggins@mmail.com | 1970-5-12 | no1651pass | true     | true      |
      | male   | Americus      | Javier    | adnana5@yrocket.it      | 1953-7-2  | haga671    | false    | false     |