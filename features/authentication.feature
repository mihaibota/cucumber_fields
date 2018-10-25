Feature: Verifications on the authentication page

  Background:
    Given I go the the store homepage

  Scenario: Check if wrong credentials login is signaled properly
    Then I click the 'sign in' button
    And the 'authentication' page should become visible


  Scenario Outline: Search for 3 products and check results with examples
    Then I enter the <product> name in the search field
    And I hit the search button
    Then I should see results with <product> title

    Examples:
      | product                     |
      | Printed Chiffon Dress       |
      | Faded Short Sleeve T-shirts |
      | Blouse                      |


  Scenario: Search for 3 products and check results with data tables
    Then on Home page I search for products

      | product                     |
      | Printed Chiffon Dress       |
      | Faded Short Sleeve T-shirts |
      | Blouse                      |





#  ----------------------------------------------------------------------------------------------------------------------
#  TODO-----------------------------                  Exercises                        ----------------------------------
#  ----------------------------------------------------------------------------------------------------------------------

#          1. Register a fictive user and check if the entered values are correct
#
#          2. Change registration info and check if the information is correct;
#
#          3. Login to the store - goto women products:
#          - check if subcategories are visible
#          - filter content by subcategories
#          (identify correctly the things that need to be checked in order to asses if the category filter process is done correctly)
#
#          4. Go to womens products and count if the number of products displayed is the same with the strings that says how
#          many products are displayed
#
#          5. Search:
#          - for a specific product,
#          - for range of products
#          Check if the search is done correctly
#
#          6. Check if filter products by color works as expected
#
#          7. Check if filter products by properties works as expected
#
#          8. Check if filter products by manufacturer works as expected
#
#          9. Check if favorites list is filled and updated
#
#          10. Check if compare products functionality works as intended


#  ----------------------------------------------------------------------------------------------------------------------
#  TODO-----------------------------        Best practices while using cucumber        ----------------------------------
#  TODO                     Please follow these instructions before creating de PR for your changes!
#  ----------------------------------------------------------------------------------------------------------------------


#                                               -------- 1 ----------
#  The declarative style describes behavior at a higher level, which I think improves the readability of the feature by
#  abstracting out the implementation details of the application.


#                 -------- Example: Imperative      -       NOT OK!
#
#                  Scenario: User logs in
#
#                    Given I am on the homepage
#
#                    When I click on the "Login" button
#
#                    And I fill in the "Email" field with "me@example.com"
#
#                    And I fill in the "Password" field with "secret"
#
#                    And I click on "Submit"
#
#                    Then I should see "Welcome to the app, John Doe"
#
#
#                 -------- Example: Declarative       -      OK!
#
#                  Scenario: User logs in
#
#                    Given I am on the homepage
#
#                    When I log in
#
#                    Then I should see a login notification




#TODO                                            -------- 2 ----------
#          =========> It is recommended to avoid using hard coded parameters (integers, strings). <============



#TODO                                            -------- 3 ----------
#           =========>  Use the DRY technique - Don't Repeat Yourself, by creating reusable code  <============


#   - Use a Page Object Pattern should be mapped to a Ruby class file, and each method within the class represents a page
#  object on the page. (Better Choice)
#
#   - Centralizes UI coupling — one place to make changes rather than multiple places throughout step definitions



#TODO                                            -------- 4 ----------
#       ========> No sleep statements. It is better to use method or function with a built-in timeout. <==========


#TODO                                            -------- 5 ----------
#                                ========> Use Cucumber configuration files. <==========


#  CUCUMBER.YML - IT SIMPLIFIES COMMAND-LINE EXECUTION BY DEFINING REUSABLE PROFILES WITHIN THE CUCUMBER.YML FILE.
#
#  Gemfile	- The Gemfile is used to manage dependencies for a Ruby project. We should also pin the versions of these
#              Ruby gems. If you don’t pin a Ruby version, it will auto update and break your automation.
#
#  Rakefile	- Rakefile is a software task management and build automation tool. It allows you to specify tasks and
#              describe dependencies as well as group tasks in namespaces.
#
#  support/env.rb - The support/env.rb is an environment configuration file for Cucumber. This file is designed to provide
#           flexibility by allowing you to do things easily, like toggle your execution environment from local to remote.
#           To fully understand all the capabilities of this support file, you should take more time to read up on all of
#           the capabilities.



#TODO                                            -------- 6 ----------
#                                ========> Use the Rubymine code auto arrange functionality <==========
#      Shortcut keys:
#
#        - Windows            -  Ctrl + Alt + L
#        - Mac                -  ⌥ + ⌘ + L