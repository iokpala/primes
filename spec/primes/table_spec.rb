require 'spec_helper'

describe Primes::Table do
  context 'can build table' do
    describe "for n number prime-numbers" do
      let(:n) { 10 }
      let(:multiplier) { Primes::Multiplier.new(n) }
      it{}
    end
  end
end
