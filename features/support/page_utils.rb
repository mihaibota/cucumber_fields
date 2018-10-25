module Utils
  class PageUtils
    def self.wait_page_to_load(page, string)
      page.wait_until do
        page.text.include? string
      end
    end
  end
end