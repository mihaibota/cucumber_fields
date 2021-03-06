@smoke_tests
Feature: Verifications on the authentication page

  Background:
    Given I go the the store homepage


#  ====== Simple scenario ======
  @authentication
  Scenario: Check if wrong credentials login is signaled properly
    Then I click the 'sign in' button
    And the 'authentication' page should become visible

#   ====== Multiple data verification with scenario outline ======
  @search
  Scenario Outline: Search for 3 products and check results with examples
    Then I enter the <product> name in the search field
    And I hit the search button
    Then I should see results with <product> title

    Examples:
      | product                     |
      | Printed Chiffon Dress       |
      | Faded Short Sleeve T-shirts |
      | Blouse                      |

#   ====== Multiple data verification with data table ======
  @search
  Scenario: Search for 3 products and check results with data tables
    Then on Home page I search for products
      | product                     |
      | Printed Chiffon Dress       |
      | Faded Short Sleeve T-shirts |
      | Blouse                      |

  


#  ----------------------------------------------------------------------------------------------------------------------
#  TODO-----------------------------                  Exercises                        ----------------------------------
#  ----------------------------------------------------------------------------------------------------------------------

#          1. Create a scenario that verifies the error messages from the login form
#
#          2. Change registration info of a demo account and check if the data from "My Personal Information" page is correct;
#
#          3. Login to the store - goto 'women' category:
#          - check if subcategories are visible
#          - filter content by subcategories
#          (identify correctly the things that need to be checked in order to asses if the category filter process is done correctly)
#
#          4. Go to women's products category and count if the number of products displayed is the same with the strings that says how
#          many products are displayed
#
#          5. Search for a product and check if all articles from 'Top Sellers' section have: title, description and price
#
#          6. Check if filter products by color works as expected
#
#          7. Check if filter products by properties works as expected
#
#          8. Check if filter products by manufacturer works as expected
#
#          9. Check if favorites list is filled and updated
#
#          10. Check if selected products are added to the comparison functionality


#  ----------------------------------------------------------------------------------------------------------------------
#  TODO-----------------------------        Best practices while using cucumber        ----------------------------------
#  TODO                     Please follow these instructions before creating de PR for your changes!
#  ----------------------------------------------------------------------------------------------------------------------

#TODO                                            -------- 1 ----------
#TODO                =========> Important items to take in consideration for a proper PR <============

#TODO    Coding:
#TODO    1. Make sure defined web-page controls have their names describing the type of the control, for each variable attach to their name:
#            _btn - for buttons;
#            _txt - for text fields;
#            _area - for text areas;
#            _select - for select lists / combo-boxes;
#            _rbtn - for radio buttons;
#            _check - for check marks;
#            _link - for links;
#            _div - for divs;
#TODO     2. It is recommended to avoid using hard coded parameters (integers, strings).

#TODO     3. Use the DRY technique - Don't Repeat Yourself, by creating reusable code
#               - Use a Page Object Pattern should be mapped to a Ruby class file, and each method within the class
#               represents a page object on the page. (Better Choice);
#
#               - Centralizes UI coupling — one place to make changes rather than multiple places throughout step
#               definitions;
#TODO     4. No sleep statements. It is better to use method or function with a built-in timeout.

#TODO     5. Use often the Rubymine code auto arrange functionality
#              Shortcut keys:
#                - Windows            -  Ctrl + Alt + L
#                - Mac                -  ⌥ + ⌘ + L

#TODO      6. Keep each scenario independent. The scenarios should run independently, without any dependencies on other scenarios.

#TODO    Pushing changes:
#TODO    1. Do a fetch and a pull from the cloned repository, before committing changes!

#TODO    2. Add comprehensive and clear descriptions for each commit;




#TODO                                           -------- 2 ----------
#                              =============>   Scenario writing styles  <===============

#                 -------- Example: Imperative      -    Imperative testing or programming is essentially spelling out
#                                                        with as much detail as necessary how to accomplish something.

#                 ==========>   Avoid this if you can!   <===============

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
#                 -------- Example: Declarative       -     Declarative testing or programming is only specifying
#                                                           (or declaring) what needs to be accomplished.

#                 ===========>  Use this more often!  <=================
#

#                  Scenario: User logs in
#
#                    Given I am on the homepage
#
#                    When I log in
#
#                    Then I should see a login notification




#TODO                                            -------- 3 ----------
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



#TODO                                            -------- 4 ----------
#                       ========> Use often the Rubymine code auto arrange functionality <==========
#      Shortcut keys:
#
#        - Windows            -  Ctrl + Alt + L
#        - Mac                -  ⌥ + ⌘ + L

