old_id_gender_state = false
old_first_name = ""
old_last_name = ""
old_email_text = "invalidmail@address.com"
old_birthday = ""
old_birthmonth = ""
old_birthyear = ""
old_password = "defaultpass"
old_newsletter_opt = false
old_optin = false
new_passowrd = ""

And(/^I store my demo account information data$/) do
  old_id_gender_state = @personal_information_page.fgender_rbtn_selected?
  old_first_name = @personal_information_page.user_firstname_txt
  old_last_name = @personal_information_page.user_lastname_txt
  old_birthday = @personal_information_page.days_select
  old_birthmonth = @personal_information_page.months_select
  old_birthyear = @personal_information_page.years_select
  old_newsletter_opt = @personal_information_page.newsletter_check_checked?
  old_optin = @personal_information_page.optin_check_checked?

  p old_id_gender_state
  p old_first_name
  p old_last_name
  p old_birthday
  p old_birthmonth
  p old_birthyear
  p old_newsletter_opt
  p old_optin

end

And(/^I change the information of my account$/) do
  p @personal_information_page.days_select_options
end

And(/^I save the changes$/) do
  @personal_information_page.save_btn
end

Then(/^The changes should be applied$/) do

end

And(/^I change back the demo account information$/) do
  if old_id_gender_state
    @personal_information_page.select_fgender_rbtn
  else
    @personal_information_page.select_mgender_rbtn
  end
  @personal_information_page.user_firstname_txt = old_first_name
  @personal_information_page.user_lastname_txt = old_last_name
  @personal_information_page.user_email_txt = old_email_text
  @personal_information_page.days_select = old_birthday
  @personal_information_page.months_select = old_birthmonth
  @personal_information_page.years_select = old_birthyear
  @personal_information_page.user_old_password_txt = old_password
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
  @personal_information_page.save_btn
end
