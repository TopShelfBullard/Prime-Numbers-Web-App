class PrimeNumber < ActiveRecord::Base
  require 'prime'

  def self.get_primes
    Prime.first(1000)
  end

end
