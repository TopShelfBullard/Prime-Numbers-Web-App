class NumberWords
  @ones = {n0:"", n1:"one", n2:"two", n3:"three", n4:"four", n5:"five", n6:"six", n7:"seven", n8:"eight", n9:"nine"}
  @tens = {n2:"twenty", n3:"thirty", n4:"forty", n5:"fifty", n6:"sixty", n7:"seventy", n8:"eighty", n9:"ninty"}
  @tens_under_20 = {n10:"ten", n11:"eleven", n12:"twelve", n13:"thirteen", n14:"fourteen", n15:"fifteen", n16:"sixteen", n17:"seventeen", n18:"eighteen", n19:"ninteen"}
  @place_values = ["", "hundred", "thousand", "million", "billion", "trillion"]

  def self.to_english(number)
    number_string = "#{number}"
    length = number_string.length
    return self.parse_hundreds_or_less(number_string, length) if(length < 4)
    return self.parse_thousands_or_greater(number_string, length).strip
  end

  private
  def self.parse_hundreds_or_less(number_string, length)
    self.send("length_of_#{length}", number_string).strip
  end

  def self.parse_thousands_or_greater(number_string, length)
    place = length % 3 == 0 ? length/3 : length/3.ceil + 1
    tail = number_string.chars.last((place - 1) * 3).join
    head = number_string.chars.first(length - tail.length).join
    "#{self.parse_hundreds_or_less(head, head.length)} #{@place_values[place]} #{self.to_english(tail.strip.to_i)}"
  end

  def self.length_of_1(number_string)
    @ones["n#{number_string}".to_sym]
  end

  def self.length_of_2(number_string)
    return self.pass_it_down(number_string) if number_string.chars[0] == "0"
    number_string.to_i < 20 ? @tens_under_20["n#{number_string}".to_sym] : self.hundreths_greater_than_19(number_string)
  end

  def self.length_of_3(number_string)
    return self.pass_it_down(number_string) if number_string.chars[0] == "0"
    "#{self.length_of_1(number_string.chars[0])} hundred #{self.length_of_2(number_string.chars.last(number_string.length - 1).join)}".strip
  end

  def self.hundreths_greater_than_19(number_string)
    last_word = self.length_of_1(number_string.chars.last)
    first_word = @tens["n#{number_string.chars.first}".to_sym]
    last_word.empty? ? "#{first_word}" : "#{first_word}-#{last_word}"
  end

  def self.pass_it_down(number_string)
    number_string = number_string.to_i.to_s
    self.send("length_of_#{number_string.length}", number_string)
  end
end