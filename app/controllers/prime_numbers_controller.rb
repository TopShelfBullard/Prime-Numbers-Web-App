class PrimeNumbersController < ApplicationController
  def index
  end

  def show
    @primes = PrimeNumber.get_primes.map{|number| NumberWords.to_english(number)}
  end
end
