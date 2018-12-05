class MyAccountPage
  include PageObject
  include PageObject::PageFactory

  page_url('http://automationpractice.com/index.php?controller=my-account')
end