# frozen_string_literal: true

class Account
  DEFAULT_BALANCE = 0

  attr_reader :balance, :amount

  def initialize
    @balance = DEFAULT_BALANCE
    @amount = amount
  end

  def deposit(amount)
    raise 'Invalid deposit' if amount.zero?

    @balance += amount
  end

  def withdraw(amount)
    raise 'Insufficient funds in your account' if insuffient_funds?

    @balance -= amount
  end

  private

  def insuffient_funds?
    @balance.negative?
  end
end
