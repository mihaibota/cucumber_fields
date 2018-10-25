class AuthenticationPage
  include PageObject

  page_url('http://automationpractice.com/index.php?controller=authentication')

  text_field(:user_email_txt, :id => 'email')
  text_field(:user_password_txt, :id => 'passwd')
  button(:sing_in_btn, :id => 'SubmitLogin')
end