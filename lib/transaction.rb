# frozen_string_literal: true

class Transaction
  DEFAULT_BALANCE = 0
  DEFAULT_CREDIT = 0
  DEFAULT_DEBIT = 0
  attr_reader :date, :credit, :debit, :balance, :transactions

  def initialize
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = DEFAULT_CREDIT
    @debit = DEFAULT_DEBIT
    @balance = DEFAULT_BALANCE
    @transactions = []
  end

  def deposit(funds)
    raise 'Invalid deposit' if funds.zero?

    @balance += funds
    transaction = {
      date: @date,
      credit: format('%.2f', funds),
      debit: '',
      balance: format('%.2f', @balance)
    }
    @transactions << transaction
  end

  def withdraw(funds)
    raise 'Insufficient funds in your account' if @balance.negative?

    @balance -= funds
    transaction = {
      date: @date,
      credit: '',
      debit: format('%.2f', funds),
      balance: format('%.2f', @balance)
    }
    @transactions << transaction
  end
end
