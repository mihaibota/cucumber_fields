class PersonalInformation
  include PageObject

  page_url('http://automationpractice.com/index.php?controller=identity')

  button(:save_btn, :name => 'submitIdentity')
  radio_button(:mgender_rbtn, :id => 'id_gender1')
  radio_button(:fgender_rbtn, :id => 'id_gender2')
  text_field(:user_firstname_txt, :id => 'firstname')
  text_field(:user_lastname_txt, :id => 'lastname')
  text_field(:user_email_txt, :id => 'email')
  select_list(:days_select, :id => 'days')
  select_list(:months_select, :id => 'months')
  select_list(:years_select, :id => 'years')
  text_field(:user_old_password_txt, :id => 'old_passwd')
  text_field(:user_new_password_txt, :id => 'passwd')
  text_field(:user_conf_password_txt, :id => 'confirmation')
  checkbox(:newsletter_check, :id => 'newsletter')
  checkbox(:optin_check, :id => 'optin')
  element(:succes_message_txt, :css => '#center_column p')

  def change_account_information(data_hash)
    file = Utils::TestUtils.open_demo_account_data
    if data_hash[:gender].downcase == "male"
      self.select_mgender_rbtn
    elsif data_hash[:gender].downcase == "female"
      self.select_fgender_rbtn
    else
      abort("Gender should be <female> or <male>, you have inserted instead: <" + data_hash[:gender] + ">")
    end
    self.user_firstname_txt = data_hash[:first_name]
    self.user_lastname_txt = data_hash[:last_name]
    self.user_email_txt = data_hash[:mail_adress]
    date_array = data_hash[:date].split("-")
    self.years_select = date_array[0].to_s
    self.months_select = date_array[1].to_s
    self.days_select = date_array[2].to_s
    self.user_old_password_txt = file["password"]
    self.user_new_password_txt = data_hash[:password]
    self.user_conf_password_txt = data_hash[:password]
    data_hash[:news_opt].downcase == "true" ? self.check_newsletter_check : self.uncheck_newsletter_check
    data_hash[:optin_opt].downcase == "true" ? self.check_optin_check : self.uncheck_optin_check
  end

  def restore_account_information(data_hash)
    file = Utils::TestUtils.open_demo_account_data
    file['mr_opt'] == 'true' ? self.select_fgender_rbtn : self.select_mgender_rbtn
    self.user_firstname_txt = file['first_name']
    self.user_lastname_txt = file['last_name']
    self.user_email_txt = file['mail']
    self.days_select = file['day_of_birth'].to_s
    self.months_select = file['month_of_birth'].to_s
    self.years_select = file['year_of_birth'].to_s
    self.user_old_password_txt = data_hash[:password]
    self.user_new_password_txt = file['password']
    self.user_conf_password_txt = file['password']
    data_hash[:news_opt].downcase == "true" ? self.check_newsletter_check : self.uncheck_newsletter_check
    data_hash[:optin_opt].downcase == "true" ? self.check_optin_check : self.uncheck_optin_check
  end

  def save_the_changes
    self.save_btn
  end
end



