And(/^the 'authentication' page should become visible$/) do
  @authentication_page.wait_until do
    @authentication_page.text.include? "AUTHENTICATION"
  end
end