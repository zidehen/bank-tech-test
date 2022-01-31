# frozen_string_literal: true

require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe '#initialize' do
    it 'initializes with a balance of zero' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it 'can deposit money into the account' do
      subject.deposit(100)
      expect(subject.balance).to eq(100)
    end

    it 'raises an error with zero deposit' do
      expect { subject.deposit(0) }.to raise_error 'Invalid deposit'
    end
  end

  describe '#withdraw' do
    it { is_expected.to respond_to(:withdraw).with(1).argument }

    it 'can withdraw money from the account' do
      subject.deposit(100)
      subject.withdraw(20)
      expect(subject.balance).to eq(80)
    end

    it 'raises an error if tries to withdraw money at zero balance' do
      subject.withdraw(10)
      expect { subject.withdraw(10) }.to raise_error 'Insufficient funds in your account'
    end
  end
end
