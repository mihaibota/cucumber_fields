class AuthenticationPage
  include PageObject

  page_url('http://automationpractice.com/index.php?controller=authentication')

  text_field(:email_create_txt, :id => 'email_create')
  button(:submit_create_btn, :id => 'SubmitCreate')
  text_field(:user_email_txt, :id => 'email')
  text_field(:user_password_txt, :id => 'passwd')
  button(:sing_in_btn, :id => 'SubmitLogin')
  element(:error_message_default_txt, :xpath => '//*[@id="center_column"]/div[1]/p')
  element(:error_message_specific_txt, :xpath => '//*[@id="center_column"]/div[1]/ol/li')
  radio_button(:mgender_rbtn, :id => 'id_gender1')
  radio_button(:fgender_rbtn, :id => 'id_gender2')
  text_field(:customer_firstname_txt, :id => 'customer_firstname')
  text_field(:customer_lastname_txt, :id => 'customer_lastname')
  select_list(:days_select, :id => 'days')
  select_list(:months_select, :id => 'months')
  select_list(:years_select, :id => 'years')
  checkbox(:newsletter_check, :id => 'newsletter')
  checkbox(:optin_check, :id => 'optin')
  text_field(:adress_firstname_txt, :id => 'firstname')
  text_field(:adress_lastname_txt, :id => 'lastname')
  text_field(:company_txt, :id => 'company')
  text_field(:adress1_txt, :id => 'address1')
  text_field(:adress2_txt, :id => 'address2')
  text_field(:city_txt, :id => 'city')
  select_list(:state_select, :id => 'id_state')
  text_field(:postcode_txt, :id => 'postcode')
  select_list(:country_select, :id => 'id_country')
  text_field(:additional_information_txt, :id => 'other')
  text_field(:phone_txt, :id => 'phone')
  text_field(:phone_mobile_txt, :id => 'phone_mobile')
  text_field(:alias_txt, :id => 'alias')
  button(:register_btn, :name => 'submitAccount')
  div(:header_user_info_div, :class => 'header_user_info')

  def login_account(username, pass)
    self.user_email_txt = username
    self.user_password_txt = pass
    self.sing_in_btn
  end

  def demo_account_is_logged?
    file = Utils::TestUtils.open_demo_account_data
    self.header_user_info_div == file['first_name'] + " " + file['last_name']
  end

  def create_demo_account
    file = Utils::TestUtils.open_demo_account_data
    self.email_create_txt = file['mail']
    self.submit_create_btn
    file['mr_opt'] == 'true' ? self.select_fgender_rbtn : self.select_mgender_rbtn
    self.customer_firstname_txt = file['first_name']
    self.customer_lastname_txt = file['last_name']
    self.user_email_txt = file['mail']
    self.user_password_txt = file['password']
    self.days_select = file['day_of_birth'].to_s
    self.months_select = file['month_of_birth'].to_s
    self.years_select = file['year_of_birth'].to_s
    self.check_newsletter_check if file['newsletter_opt'] == 'true'
    self.check_optin_check if file['optin_opt'] == 'true'
    self.adress_firstname_txt = file['first_name']
    self.adress_lastname_txt = file['last_name']
    self.company_txt = file['company']
    self.adress1_txt = file['adress1']
    self.adress2_txt = file['adress2']
    self.city_txt = file['city']
    self.state_select = file['state']
    self.postcode_txt = file['zip_code']
    self.country_select = file['country']
    self.phone_txt = file['home_phone']
    self.register_btn
  end
end

