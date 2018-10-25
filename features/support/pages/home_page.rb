class HomePage
  include PageObject
  include PageObject::PageFactory

  page_url('http://automationpractice.com/index.php')

  link(:sign_in, :class => 'login')
  link(:women_btn, :name => 'Women')
  text_field(:search_field, :id => 'search_query_top')
  button(:search_btn, :name => 'submit_search')

end