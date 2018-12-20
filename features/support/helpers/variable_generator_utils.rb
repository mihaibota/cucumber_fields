module Utils
  class VariableGeneratorUtils
    @@RANGE_ALPHANUM = [*'0'..'9', *'A'..'Z', *'a'..'z']
    @@RANGE_ALPHA = [*'A'..'Z', *'a'..'z']
    @@RANGE_NUM = [*'0'..'9']

    def self.generate_random_alphanumeric_string(size)
      Array.new(size) {@@RANGE_ALPHANUM.sample}.join
    end

    def self.generate_random_alpha_string(size)
      Array.new(size) {@@RANGE_ALPHA.sample}.join
    end

    def self.generate_random_numeric_string(size)
      Array.new(size) {@@RANGE_NUM.sample}.join
    end

    def self.generate_random_name(size)
      self.generate_random_alpha_string(size).capitalize
    end

    def self.generate_random_mail_adress(sizeUserName, sizeAdress, sizeDomain)
      (self.generate_random_alphanumeric_string(sizeUserName) + "@" + self.generate_random_alphanumeric_string(sizeAdress) + "." + self.generate_random_alpha_string(sizeDomain)).downcase
    end

    def self.generate_random_password(size)
      self.generate_random_alphanumeric_string(size)
    end
  end
end