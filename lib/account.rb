class Account
  
  DEFAULT_BALANCE = 0

  attr_reader :balance

  def initialize
    @balance = DEFAULT_BALANCE
  end
 
  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    fail 'Insufficient funds in your account' if @balance < 0
    @balance -= amount
  end
end