require 'spec_helper'

describe Primes::Table do
  context 'table building' do
    describe "for n number prime-numbers" do
      let(:n) { 10 }
      let(:multiplier) { Primes::Multiplier.new(n) }
      let(:table) { Primes::Table.new(multiplier) }
      let(:padding) { table.send(:padding) }
      subject { table.send(:build) }
      let(:head){"|    2    3    5    7    11   13   17   19   23   29"}
      let(:dashes){"-----+­---------------------------------------------------"}

      it 'containing n+2 rows' do
        expect(subject.count).to eq(n+2)
      end

      it 'containing heading row' do
        expect(subject.first.strip).to eq(head)
      end

      it 'containing dashes row' do
        expect(subject[1].strip).to eq(dashes)
      end

      it 'with whitespace padding equal to character length of the highest product' do
        expect(subject.last.strip.split.last.length).to eq(3)
      end

      it 'containing one pipe, whitespaces and numbers in each cell' do
        subject.drop(2).each do |cell|
          expect(cell).to match(/^\d+\s+\|\s+(\d+\s+)+\d+\s+$/)
        end
      end
    end
  end
end
