And(/^the 'authentication' page should become visible$/) do
  @authentication_page.wait_until do
    @authentication_page.text.include? "AUTHENTICATION"
  end
end

Then(/^on the Auth page I enter the wrong credentials and look for the errors$/) do |table|
  data = table.hashes
  data.each do |element|
    @authentication_page.user_email_txt = element[element.keys[element.keys.count - 3]]
    @authentication_page.user_password_txt = element[element.keys[element.keys.count - 2]]
    @authentication_page.sing_in_btn
    @authentication_page.error_message_default_txt.should == "There is 1 error"
    @authentication_page.error_message_specific_txt.should == element[element.keys[element.keys.count - 1]]
  end
end

Given(/^I log in with the demo account$/) do
  file = Utils::TestUtils.open_demo_account_data
  @authentication_page.goto
  @authentication_page.login_account(file['mail'], file['password'])
  if !@authentication_page.demo_account_is_logged?
    @authentication_page.goto
    @authentication_page.create_demo_account
  end
end

