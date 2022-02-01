# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:date) { Time.now.strftime('%d/%m/%Y') }
  subject(:transaction) { described_class.new }

  describe '#initialize' do
    it 'should have a date' do
      expect(subject.date).to eq(date)
    end

    it 'should have a value for credit' do
      expect(subject.credit).to eq(0)
    end

    it 'should have a value for debit' do
      expect(subject.debit).to eq(0)
    end

    it 'should have a balance' do
      expect(subject.balance).to eq(0)
    end

    it 'should initialize with an empty array' do
      expect(subject.transactions).to eq []
    end
  end
end
