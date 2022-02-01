# frozen_string_literal: true

require 'transaction'
require 'account'

describe Transaction do
  let(:date) { Time.now.strftime('%d/%m/%Y') }
  let(:balance) { 100 }
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

  describe '#deposit' do
    it 'should increase the bank balance by the specified amount' do
      subject.deposit(100)
      expect(subject.balance).to eq(100)
    end

    it 'should add to transactions when a deposit is made' do
      subject.deposit(100)

      expect(subject.transactions.length).to eq 1
      expect(subject.transactions[0][:date]).to eq date
      expect(subject.transactions[0][:credit]).to eq '100.00'
      expect(subject.transactions[0][:debit]).to eq ''
      expect(subject.transactions[0][:balance]).to eq '100.00'
    end

    it 'raises an error with zero deposit' do
      expect { subject.deposit(0) }.to raise_error 'Invalid deposit'
    end
  end

  describe '#withdraw' do
    it 'should decrease the bank balance by the specified amount' do
      subject.deposit(100)
      subject.withdraw(50)
      expect(subject.balance).to eq(50)
    end

    it 'should add to transaction history when a withdrawal is made' do
      subject.deposit(100)
      subject.withdraw(50)

      expect(subject.transactions.length).to eq 2
      expect(subject.transactions[1][:date]).to eq date
      expect(subject.transactions[1][:credit]).to eq ''
      expect(subject.transactions[1][:debit]).to eq '50.00'
      expect(subject.transactions[1][:balance]).to eq '50.00'
    end

    it 'raises an error if tries to withdraw money at zero balance' do
      subject.withdraw(10)
      expect { subject.withdraw(10) }.to raise_error 'Insufficient funds in your account'
    end
  end
end
