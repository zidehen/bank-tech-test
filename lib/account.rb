# frozen_string_literal: true

require_relative 'transaction'
class Account
  attr_reader :transaction

  def initialize(transaction)
    @transaction = transaction
  end

  def deposit(funds)
    @transaction.deposit(funds)
  end

  def withdraw(funds)
    @transaction.withdraw(funds)
  end
end
