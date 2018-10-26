
Then(/^I click the 'sign in' button$/) do
  @home_page.sign_in
end

Then(/^I enter the (.*) name in the search field$/) do |product|
  @home_page.search_field = product
end

And(/^I hit the search button$/) do
  @home_page.search_btn
end

Then(/^I wait for the results page to appear$/) do
  @home_page.sort_bar_element.when_present
end

Then(/^on Home page I search for products$/) do |table|
  data = table.hashes

  data.each do |prod|
    unless prod.eql?('product')
      @home_page.search_field = prod['product']
      @home_page.search_btn
      @search_results.sort_bar_element.when_present
      @search_results.get_product_names_arr.include?(prod['product']).should == true
      @home_page.goto
    end
  end
end

Then(/^I should see results with (.*) title$/) do |product|
  @search_results.get_product_names_arr.include?(product).should == true
end