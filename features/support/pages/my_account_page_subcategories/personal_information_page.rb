class PersonalInformation
  include PageObject
  include PageObject::PageFactory

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

end