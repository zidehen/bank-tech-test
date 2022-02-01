# frozen_string_literal: true

require 'account'
require 'transaction'

describe Account do
  subject(:account) { described_class.new(transaction) }
  let(:transaction) { double(:transaction, deposit: 100, withdraw: 20) }

  describe '#initialize' do
    it 'should create a instance of transaction' do
      expect(account.transaction).to eq transaction
    end
  end

  describe '#deposit' do
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it 'should deposit money into the account' do
      subject.deposit(100)
      expect(transaction).to have_received(:deposit).with(100)
    end
  end

  describe '#withdraw' do
    it { is_expected.to respond_to(:withdraw).with(1).argument }

    it 'can withdraw money from the account' do
      subject.deposit(100)
      subject.withdraw(20)
      expect(transaction).to have_received(:withdraw).with(20)
    end
  end
end
