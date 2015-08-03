require 'spec_helper'

describe Primes::Multiplier do
  context 'when n number of prime-numbers' do
    let(:n) { 10 }
    let(:multiplier) { Primes::Multiplier.new(n) }
    let(:products){[[4, 6, 10, 14, 22, 26, 34, 38, 46, 58],
                    [6, 9, 15, 21, 33, 39, 51, 57, 69, 87],
                    [10, 15, 25, 35, 55, 65, 85, 95, 115, 145],
                    [14, 21, 35, 49, 77, 91, 119, 133, 161, 203],
                    [22, 33, 55, 77, 121, 143, 187, 209, 253, 319],
                    [26, 39, 65, 91, 143, 169, 221, 247, 299, 377],
                    [34, 51, 85, 119, 187, 221, 289, 323, 391, 493],
                    [38, 57, 95, 133, 209, 247, 323, 361, 437, 551],
                    [46, 69, 115, 161, 253, 299, 391, 437, 529, 667],
                    [58, 87, 145, 203, 319, 377, 493, 551, 667, 841]]}
    let(:factors) {multiplier.factors}

    describe 'multipling each (products)' do
      subject{multiplier.products}

      it 'produces n * n number of elements' do
        expect(subject.flatten.count).to eq(n*n)
      end

      it 'returns products' do
        factors.each_with_index do |f, index|
          expect(factors.map{|tp| tp*f}).to eq(products[index])
        end
      end
    end

    describe 'factors' do
      subject{multiplier.factors}
      it 'contains list of 10 elements' do
        expect(subject.count).to eq(10)
      end

      it 'contains only prime numbers' do
        subject.each do |p|
          expect(multiplier.send('is_prime?',p)).to be(true)
        end
      end
    end

    describe 'prime number predicate' do
      subject{Primes::Multiplier.new(1)}
      it '5 is a prime number' do
        expect(subject.send('is_prime?',5)).to be(true)
      end

      it '8 is not a prime number' do
        expect(subject.send('is_prime?',8)).to be(false)
      end
    end
  end
end
