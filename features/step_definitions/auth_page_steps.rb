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

When (/^I log in with a demo account$/) do
  name = "invalidmail@address.com"
  password = "defaultpass"
  @authentication_page.user_email_txt = name
  @authentication_page.user_password_txt = password
  @authentication_page.sing_in_btn
end
