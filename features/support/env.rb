require 'page-object'
require 'page-object/page_factory'
require 'selenium-webdriver'

World(PageObject::PageFactory)

Before do
  @driver = Selenium::WebDriver.for :chrome
  @home_page = HomePage.new(@driver)
  @search_results = SearchResults.new(@driver)
  @authentication_page = AuthenticationPage.new(@driver)
  @my_account_page = MyAccountPage.new(@driver)
  @personal_information_page = PersonalInformation.new(@driver)
end

After do |scenario|
  @driver.quit
end