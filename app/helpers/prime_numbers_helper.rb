module PrimeNumbersHelper
  def primes_in_groups(primes, group_size)
    groups = []

    while primes.length > 0
      groups << each_into_span(primes.shift(group_size).join(", split_here").split("split_here"))
    end

    groups
  end

  private
  def change_color(color)
    color.include?("offset") ? "normal_color" : "offset_color"
  end

  def each_into_span(numbers)
    color = "offset_color"
    numbers.map{ |number| "<span class=\"#{color = change_color(color)}\">#{number.capitalize}</span>" }.join.html_safe
  end
end
