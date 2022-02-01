# frozen_string_literal: true

require_relative 'transaction'
class Account
  DEFAULT_BALANCE = 0
  attr_reader :balance, :transaction

  def initialize(transaction)
    @balance = DEFAULT_BALANCE
    @transaction = transaction
  end

  def deposit(funds)
    raise 'Invalid deposit' if funds.zero?

    @transaction.deposit(funds)
  end

  def withdraw(amount)
    raise 'Insufficient funds in your account' if insufficient_funds?

    @balance -= amount
  end

  private

  def insufficient_funds?
    @balance.negative?
  end
end
