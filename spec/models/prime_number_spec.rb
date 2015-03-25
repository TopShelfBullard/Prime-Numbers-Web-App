require "rails_helper"

RSpec.describe PrimeNumber, :type => :model do
  it "has a length of 1000" do
    expect(PrimeNumber.get_primes.length).to eq(1000)
  end

  it "contains only prime numbers" do
    results = PrimeNumber.get_primes.map{|number| Prime.prime?(number)}
    expect(results.include?(false)).to be_falsey
  end

  it "contains no duplicates" do
    results = PrimeNumber.get_primes
    expect(results.length).to eq(results.uniq.length)
  end

  it "it is sorted smallest to largest" do
    prior_number = 1
    PrimeNumber.get_primes.each do |current_number|
      expect(current_number > prior_number).to be_truthy
      prior_number = current_number
    end
  end

  it "starts with 2" do
    expect(PrimeNumber.get_primes).to start_with(2)
  end

  it "ends with 7919" do
    expect(PrimeNumber.get_primes).to end_with(7919)
  end
end