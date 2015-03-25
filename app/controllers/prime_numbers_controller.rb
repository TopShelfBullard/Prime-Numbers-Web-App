class PrimeNumbersController < ApplicationController
  def index
  end

  def show
    @primes = PrimeNumber.get_primes
  end
end
