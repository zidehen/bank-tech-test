# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'

class Account
  attr_reader :transaction, :statement

  def initialize(transaction, statement)
    @transaction = transaction
    @statement = statement
  end

  def deposit(funds)
    @transaction.deposit(funds)
  end

  def withdraw(funds)
    @transaction.withdraw(funds)
  end

  def print_statement
    @statement.print(@transaction.transactions)
  end
end
