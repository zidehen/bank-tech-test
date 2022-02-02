# frozen_string_literal: true

require 'account'
require 'transaction'
require 'statement'

describe Account do
  subject(:account) { described_class.new(transaction, statement) }
  let(:transaction) { double(:transaction, deposit: 100, withdraw: 20) }
  let(:statement) do
    double(:statement, header: 'date || credit || debit || balance', print: '31/01/2022 || 100.00 ||  || 100.00\n')
  end

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

  describe '#print_statement' do
    it 'should print the bank statement with header and each transaction' do
      allow(statement).to receive(:print)
      allow(transaction).to receive(:transactions)
      account.print_statement
      expect(statement).to have_received(:print)
    end
  end
end
