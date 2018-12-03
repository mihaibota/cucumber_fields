And(/^the 'authentication' page should become visible$/) do
  @authentication_page.wait_until do
    @authentication_page.text.include? "AUTHENTICATION"
  end
end

When(/^I enter the (.*) mail adress in the email field$/) do |name|
  @authentication_page.user_email_txt = name
end

When(/^I enter the (.*) password in the password field$/) do |password|
  @authentication_page.user_password_txt = password
end

When(/^I click the "Sign in" button on the Authentification page$/) do
  @authentication_page.sing_in_btn
end

Then(/^The (.*) error should be displayed$/) do |error|
  if @authentication_page.error_message_specific_txt != error
    puts "<" + @authentication_page.error_message_specific_txt + "> was discovered instead of: " + error
  end
  @authentication_page.error_message_specific_txt.should == error
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