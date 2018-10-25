Given(/^I go the the store homepage$/) do
  # visit HomePage
  @home_page.goto
end

Then(/^I go to the sign in page$/) do
  @authentication_page.goto
end