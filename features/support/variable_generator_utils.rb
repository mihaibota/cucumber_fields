module Utils
  class VariableGeneratorUtils
    @@range_alphanum = [*'0'..'9', *'A'..'Z', *'a'..'z']
    @@range_alpha = [*'A'..'Z', *'a'..'z']
    @@range_num = [*'0'..'9']

    def self.putsLetterA
      p "A"
    end

    def self.generateRandomAlphaNumericString(size)
      Array.new(size) {@@range_alphanum.sample}.join
    end

    def self.generateRandomAlphaString(size)
      Array.new(size) {@@range_alpha.sample}.join
    end

    def self.generateRandomNumericString(size)
      Array.new(size) {@@range_num.sample}.join
    end

    def self.generateRandomName(size)
      self.generateRandomAlphaString(size).capitalize
    end

    def self.generateRandomMailAdress(sizeUserName, sizeAdress, sizeDomain)
      (self.generateRandomAlphaNumericString(sizeUserName) + "@" + self.generateRandomAlphaNumericString(sizeAdress) + "." + self.generateRandomAlphaString(sizeDomain)).downcase
    end

    def self.generateRandomPassword(size)
      self.generateRandomAlphaNumericString(size)
    end
  end
end