# frozen_string_literal: true

class Transaction
  DEFAULT_BALANCE = 0
  attr_reader :date, :credit, :debit, :balance, :transactions

  def initialize
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = 0
    @debit = 0
    @balance = DEFAULT_BALANCE
    @transactions = []
  end
end
