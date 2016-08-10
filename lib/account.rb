#Understands how to update the account transaction history
require 'time'

class Account

  def initialize
    @transactions_history = []
  end
  
  def deposit(amount) #GBP, expressed in pence
    add_transaction(amount)
  end

  def withdraw(amount) #GBP, expressed in pence
    add_transaction(-amount)
  end

  def statement
    @transactions_history
  end

private

  def add_transaction(amount)
    @transactions_history << { date: Time.now, amount: amount }
  end

end
