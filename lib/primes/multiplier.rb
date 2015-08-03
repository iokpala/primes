module Primes
  class Multiplier
    attr_reader :factors, :products

    def initialize(nth)
      @nth = nth
    end

    def factors
      @factors ||= [].tap do |primes|
        2.step do |num|
          primes << num if is_prime?(num)
          break if primes.size == @nth
        end
      end
    end

    def products
      @products ||= factors.map{|factor| factors.map{|p| p * factor}}
    end

  protected

    def is_prime?(num)
      return false if num == 0 || num == 1
      ((2..(Math.sqrt(num)))).each do |i|
        return false if num % i == 0
      end
      true
    end
  end
end
