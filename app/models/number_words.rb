class NumberWords
  @ones = {n0:"", n1:"one", n2:"two", n3:"three", n4:"four", n5:"five", n6:"six", n7:"seven", n8:"eight", n9:"nine"}
  @tens = {n2:"twenty", n3:"thirty", n4:"forty", n5:"fifty", n6:"sixty", n7:"seventy", n8:"eighty", n9:"ninty"}
  @tens_under_20 = {n10:"ten", n11:"eleven", n12:"twelve", n13:"thirteen", n14:"fourteen", n15:"fifteen", n16:"sixteen", n17:"seventeen", n18:"eighteen", n19:"ninteen"}
  @place_values = ["", "hundred", "thousand", "million", "billion", "trillion", "zillion"]

  def self.to_english(number)
    number_string = "#{number}"
    length = number_string.length
    return self.send("length_of_#{length}", number_string).strip if length < 4
    place_value = @place_values[length % 3 == 0 ? length/3 : length/3.ceil + 1]
    return self.length_greater_than_3(number_string, 3, place_value).strip if number_string.length < 7
    return self.length_greater_than_3(number_string, 6, place_value).strip if number_string.length < 10
    return self.length_greater_than_3(number_string, 9, place_value).strip if number_string.length < 13
    return self.length_greater_than_3(number_string, 12, place_value).strip
  end

  private
  def self.length_of_1(number_string)
    @ones["n#{number_string}".to_sym]
  end

  def self.length_of_2(number_string)
    return self.pass_it_down(number_string) if self.begins_with_zero(number_string)
    number_string.to_i < 20 ? @tens_under_20["n#{number_string}".to_sym] : self.hundreths_greater_than_19(number_string)
  end

  def self.length_of_3(number_string)
    return self.pass_it_down(number_string) if self.begins_with_zero(number_string)
    "#{self.length_of_1(number_string.chars[0])} hundred #{self.length_of_2(number_string.chars.last(number_string.length - 1).join)}".strip
  end

  def self.hundreths_greater_than_19(number_string)
    last_word = self.length_of_1(number_string.chars.last)
    first_word = @tens["n#{number_string.chars.first}".to_sym]
    last_word.empty? ? "#{first_word}" : "#{first_word}-#{last_word}"
  end

  def self.length_greater_than_3(number_string, tail_length, place)
    digits = number_string.length - tail_length
    first = self.send("length_of_#{digits}", "#{number_string.chars.first(digits).join}")
    last = self.to_english((number_string.chars.last(tail_length).join).strip.to_i)
    first.empty? ? last : "#{first} #{place} #{last}"
  end

  def self.begins_with_zero(number_string)
    number_string.chars[0] == "0"
  end

  def self.pass_it_down(number_string)
    self.send("length_of_#{number_string.length - 1}", number_string.chars.last(number_string.length - 1).join)
  end
end