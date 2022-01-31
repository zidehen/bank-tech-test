class Transaction

  attr_reader :date, :credit, :debit, :balance, :transactions

  def initialize(date, credit, debit, balance)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
    @transactions = []
  end
end