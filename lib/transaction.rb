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

    add_balance(funds)
    view_deposit_transaction(funds)
  end

  def withdraw(funds)
    raise 'Insufficient funds in your account' if @balance.negative?

    deduct_balance(funds)
    view_withdraw_transaction(funds)
  end

  private

  def add_balance(funds)
    @balance += funds
  end

  def view_deposit_transaction(funds)
    transaction = {
      date: @date,
      credit: format('%.2f', funds),
      debit: '',
      balance: format('%.2f', @balance)
    }
    @transactions << transaction
  end

  def deduct_balance(funds)
    @balance -= funds
  end

  def view_withdraw_transaction(funds)
    transaction = {
      date: @date,
      credit: '',
      debit: format('%.2f', funds),
      balance: format('%.2f', @balance)
    }
    @transactions << transaction
  end
end
