class Account
  
  DEFAULT_BALANCE = 0

  attr_reader :balance

  def initialize
    @balance = DEFAULT_BALANCE
  end
 
  def deposit(amount)
    raise 'Invalid deposit' if nil_amount?
    @balance += amount
  end

  def withdraw(amount)
    raise 'Insufficient funds in your account' if insuffient_funds?
    @balance -= amount
  end

  private

  def insuffient_funds?
    @balance < 0
  end

  def nil_amount?
    amount == 0
  end
end