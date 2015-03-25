class NumberWords
  @tenths = {n0:"", n1:"one", n2:"two", n3:"three", n4:"four", n5:"five", n6:"six", n7:"seven", n8:"eight", n9:"nine"}
  @hundreths = {n2:"twenty", n3:"thirty", n4:"forty", n5:"fifty", n6:"sixty", n7:"seventy", n8:"eighty", n9:"ninty"}
  @hundreths_under_20 = {n10:"ten", n11:"eleven", n12:"twelve", n13:"thirteen", n14:"fourteen", n15:"fifteen", n16:"sixteen", n17:"seventeen", n18:"eighteen", n19:"ninteen"}

  def self.to_english(number)
    number_string = "#{number}"
    self.send("length_of_#{number_string.length}", number_string).squeeze(" ")
  end

  private
  def self.length_of_1(number_string)
    @tenths["n#{number_string}".to_sym]
  end

  def self.length_of_2(number_string)
    return self.number_without_first_digit(number_string) if self.begins_with_zero(number_string)
    number_string.to_i < 20 ? @hundreths_under_20["n#{number_string}".to_sym] : self.hundreths_greater_than_19(number_string)
  end

  def self.length_of_3(number_string)
    return self.number_without_first_digit(number_string) if self.begins_with_zero(number_string)
    "#{self.length_of_1(number_string.chars[0])} hundred #{self.length_of_2(number_string.last(number_string.length - 1))}".strip
  end

  def self.length_of_4(number_string)
    return self.number_without_first_digit(number_string) if self.begins_with_zero(number_string)
    "#{self.length_of_1(number_string.chars[0])} thousand #{self.length_of_3(number_string.chars.last(number_string.length - 1).join)}".strip
  end

  def self.hundreths_greater_than_19(number_string)
    last_word = self.length_of_1(number_string.chars.last)
    first_word = @hundreths["n#{number_string.chars.first}".to_sym]
    last_word.empty? ? "#{first_word}" : "#{first_word}-#{last_word}"
  end

  def self.begins_with_zero(number_string)
    number_string.chars[0] == "0"
  end

  def self.number_without_first_digit(number_string)
    self.send("length_of_#{number_string.length - 1}", number_string.chars.last(number_string.length - 1).join)
  end
end