# frozen_string_literal: true

require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new('31/01/2022', '100', '20', '500') }

  describe '#initialize' do
    it 'should have a date' do
      expect(subject.date).to eq('31/01/2022')
    end

    it 'should have a credit amount' do
      expect(subject.credit).to eq('100')
    end

    it 'should have a debit amount' do
      expect(subject.debit).to eq('20')
    end

    it 'should have a balance' do
      expect(subject.balance).to eq('500')
    end
  end
end