require "primes/multiplier"
require "primes/table"

module Primes
  def self.print(nth=10)
    multiplier = Multiplier.new(nth)
    Table.new(multiplier).print
  end
end
