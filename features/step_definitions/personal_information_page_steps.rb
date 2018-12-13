And(/^I change the (.*),(.*),(.*),(.*),(.*),(.*),(.*),(.*) of my account$/) do |gender, first_name, last_name, mail_adress, date, password, news_opt, optin_opt|
  @new_data_hash = {
      gender: gender.strip,
      first_name: first_name.strip,
      last_name: last_name.strip,
      mail_adress: mail_adress.strip,
      date: date.strip,
      password: password.strip,
      news_opt: news_opt.strip,
      optin_opt: optin_opt.strip
  }
  @personal_information_page.change_account_information(@new_data_hash)
end

Then(/^Saving the changed account information$/) do
  @personal_information_page.save_the_changes
  @personal_information_page.succes_message_txt.should == "Your personal information has been successfully updated."
end

Then(/^The changes should be applied$/) do
  if @new_data_hash[:gender].downcase == "male"
    @personal_information_page.fgender_rbtn_selected?.should == false
  else
    @personal_information_page.fgender_rbtn_selected?.should == true
  end
  @personal_information_page.user_firstname_txt.should == @new_data_hash[:first_name]
  @personal_information_page.user_lastname_txt.should == @new_data_hash[:last_name]
  @personal_information_page.user_email_txt.should == @new_data_hash[:mail_adress]
  date_array = @new_data_hash[:date].split("-")
  @personal_information_page.years_select.strip == date_array[0]
  @personal_information_page.months_select.strip == Utils::TestUtils.convert_int_to_month_name(date_array[1].to_i)
  @personal_information_page.days_select.strip == date_array[2]
  @personal_information_page.newsletter_check_checked?.to_s.should == @new_data_hash[:news_opt]
  @personal_information_page.optin_check_checked?.to_s.should == @new_data_hash[:optin_opt]
end

Then(/^I succesfully change back the demo account information$/) do
  @personal_information_page.restore_account_information(@new_data_hash)
  @personal_information_page.save_the_changes
  @personal_information_page.succes_message_txt.should == "Your personal information has been successfully updated."
end
