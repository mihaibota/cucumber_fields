#====backup fields=====
old_first_name = ""
old_last_name = ""
old_email_text = "invalidmail@address.com"
old_birthday = ""
old_birthmonth = ""
old_birthyear = ""
old_password = "defaultpass"
old_gender_state = false
old_newsletter_opt = false
old_optin = false
#====new fields - used for changing the user information=========
new_password = Utils::VariableGeneratorUtils.generate_random_password(Random.new.rand(5..12))
new_first_name = Utils::VariableGeneratorUtils.generate_random_name(Random.new.rand(5..12))
new_last_name = Utils::VariableGeneratorUtils.generate_random_name(Random.new.rand(3..10))
new_email_text = Utils::VariableGeneratorUtils.generate_random_mail_adress(Random.new.rand(5..10), Random.new.rand(5..10), Random.new.rand(2..3))
new_birthday = ""
new_birthmonth = ""
new_birthyear = ""
new_gender_state = false
new_newsletter_opt = false
new_optin = false

And(/^I store my demo account information data$/) do
  #storing the old data from the account (except the mail adress and the password)
  old_gender_state = @personal_information_page.fgender_rbtn_selected?
  old_first_name = @personal_information_page.user_firstname_txt
  old_last_name = @personal_information_page.user_lastname_txt
  old_birthday = @personal_information_page.days_select
  old_birthmonth = @personal_information_page.months_select
  old_birthyear = @personal_information_page.years_select
  old_newsletter_opt = @personal_information_page.newsletter_check_checked?
  old_optin = @personal_information_page.optin_check_checked?
end

And(/^I change the information of my account$/) do
  #changing the radio button and storing the new change
  if old_gender_state
    @personal_information_page.select_fgender_rbtn
  else
    @personal_information_page.select_mgender_rbtn
  end
  new_gender_state = @personal_information_page.fgender_rbtn_selected?
  #changing the user info using randomised data
  @personal_information_page.user_firstname_txt = new_first_name
  @personal_information_page.user_lastname_txt = new_last_name
  @personal_information_page.user_email_txt = new_email_text
  #changing the year, month and day using randomised data from the data pool
  # and storing the changed data
  years_arr = @personal_information_page.years_select_options
  upp_limit = (years_arr.size) - 1
  new_birthyear = years_arr[Random.new.rand(1..upp_limit)]
  @personal_information_page.years_select = new_birthyear
  months_arr = @personal_information_page.months_select_options
  upp_limit = (months_arr.size) - 1
  new_birthmonth = months_arr[Random.new.rand(1..upp_limit)]
  @personal_information_page.months_select = new_birthmonth
  days_arr = @personal_information_page.days_select_options
  upp_limit = (days_arr.size) - 1
  new_birthday = days_arr[Random.new.rand(1..upp_limit)]
  @personal_information_page.days_select = new_birthday
  #setting the password data for changing the information
  @personal_information_page.user_old_password_txt = old_password
  @personal_information_page.user_new_password_txt = new_password
  @personal_information_page.user_conf_password_txt = new_password
  #checking the checkbox status, changing their state and storing the data
  if !old_newsletter_opt
    @personal_information_page.check_newsletter_check
  else
    @personal_information_page.uncheck_newsletter_check
  end
  new_newsletter_opt = @personal_information_page.newsletter_check_checked?
  if !old_optin
    @personal_information_page.check_optin_check
  else
    @personal_information_page.uncheck_optin_check
  end
  new_optin = @personal_information_page.optin_check_checked?
end

Then(/^Saving the changes is possible and succeds$/) do
  #changing the info and waiting for the confirmation prompt
  @personal_information_page.save_btn
  @personal_information_page.succes_message_txt.should == "Your personal information has been successfully updated."
  #logs password and mail for accessing the account in case of test case scenario break
  p "The new mail adress: <" + new_email_text + "> and the new password: <" + new_password + "> in case the test breaks without restoring the old account data."
end

Then(/^The changes should be applied$/) do
  #checking the data from the forms to be the new set
  @personal_information_page.fgender_rbtn_selected?.should == new_gender_state
  @personal_information_page.user_firstname_txt.should == new_first_name
  @personal_information_page.user_lastname_txt.should == new_last_name
  @personal_information_page.user_email_txt.should == new_email_text
  @personal_information_page.years_select == new_birthyear
  @personal_information_page.months_select == new_birthmonth
  @personal_information_page.days_select == new_birthday
  @personal_information_page.newsletter_check_checked?.should == new_newsletter_opt
  @personal_information_page.optin_check_checked?.should == new_optin
  #new password is checked at restoring the old account info
end

Then(/^I succesfully change back the demo account information$/) do
  #setting back the old data
  if old_gender_state
    @personal_information_page.select_fgender_rbtn
  else
    @personal_information_page.select_mgender_rbtn
  end
  @personal_information_page.user_firstname_txt = old_first_name
  @personal_information_page.user_lastname_txt = old_last_name
  @personal_information_page.user_email_txt = old_email_text
  @personal_information_page.years_select = old_birthyear
  @personal_information_page.months_select = old_birthmonth
  @personal_information_page.days_select = old_birthday
  @personal_information_page.user_old_password_txt = new_password
  @personal_information_page.user_new_password_txt = old_password
  @personal_information_page.user_conf_password_txt = old_password
  if old_newsletter_opt
    @personal_information_page.check_newsletter_check
  else
    @personal_information_page.uncheck_newsletter_check
  end
  if old_optin
    @personal_information_page.check_optin_check
  else
    @personal_information_page.uncheck_optin_check
  end
  #changing the account to the old one and waiting for the success prompt
  @personal_information_page.save_btn
  @personal_information_page.succes_message_txt.should == "Your personal information has been successfully updated."
end
