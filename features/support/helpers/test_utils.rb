module Utils
  class TestUtils
    def self.open_yml_data(file_name)
      require 'yaml'
      YAML.load_file(file_name)
    end

    def self.open_demo_account_data
      demo_account_data_path = Dir.pwd + "/config/demo_account_data.yml"
      open_yml_data(demo_account_data_path)
    end

    def self.convert_int_to_month_name(int)
      require 'date'
      Date::MONTHNAMES[int]
    end
  end

end