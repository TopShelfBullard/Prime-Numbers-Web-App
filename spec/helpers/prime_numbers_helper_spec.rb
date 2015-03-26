require "rails_helper"

RSpec.describe PrimeNumbersHelper, :type => :helper do
  it "can product the desired html" do
    test_strings = ["first", "second", "third", "fourth"]
    number_groups = helper.primes_in_groups(test_strings, 2)
    expect(number_groups.first).to eq("<span class=\"normal_color\">First, </span><span class=\"offset_color\">Second</span>")
    expect(number_groups.last).to eq("<span class=\"normal_color\">Third, </span><span class=\"offset_color\">Fourth</span>")
  end

end