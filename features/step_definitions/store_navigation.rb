Given(/^I go the the store homepage$/) do
  # visit HomePage
  @home_page.goto
end

Then(/^I go to the sign in page$/) do
  @authentication_page.goto
end

Then(/^I go to the my account page$/) do
  @my_account_page.goto
end

Then(/^I go to the my personal information page$/) do
  @personal_information_page.goto
end