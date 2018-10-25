class SearchResults
  include PageObject

  div( :sort_bar, :css => '.sortPagiBar.clearfix')
  divs(:prod_containers, :class => 'product-container')
  div(:prod_title, :class => 'product-name')

  def get_product_names_arr
    titles = []
    self.prod_containers_elements.each do |prod|
      titles << prod.link(:class => 'product-name').text
    end
    titles
  end
end