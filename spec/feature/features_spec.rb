require 'time'
require 'timecop'

describe 'Features' do

  context 'default' do

    #US1
    #As a person with some money
    #So I can avoid storing all of my cash in the mattress
    #I want to open an account

    #US2
    #As a bank
    #So I do not give away money
    #I want a brand new account to have no balance

    it 'User opens the account, TerminalPrinter#print_statement shows no transactions' do
      my_account = Account.new 
      terminal_printer = TerminalPrinter.new
      expect { terminal_printer.print_statement(my_account.statement) }.to output("date || credit || debit || balance\n").to_stdout
    end

    #US3
    #As a person with some money
    #So I can put my money into the account
    #I want to deposit into the account
    it 'User opens the account, Account#deposit does not raise an error' do
      my_account = Account.new 
      expect { my_account.deposit(34500) }.to_not raise_error
    end

    #US4
    #As a person with some money
    #So I can have money to use
    #I want to withdraw from the account
    it 'User opens the account, Account#withdraw does not raise an error' do
      my_account = Account.new 
      expect { my_account.withdraw(34500) }.to_not raise_error
    end


    #US5
    #As a person with some money
    #So I can find out what my account balance is and inspect my transactions
    #I want to print the account statement
    it 'User opens the account, deposits some money, TerminalPrinter#print_statement shows the transaction with date' do
      my_account = Account.new 
      terminal_printer = TerminalPrinter.new
      my_account.deposit(100000)

      expect { terminal_printer.print_statement(my_account.statement) }.to output("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end

    it 'User opens the account, makes a few transactions, TerminalPrinter#print_statement shows the transaction with date' do
      my_account = Account.new 
      terminal_printer = TerminalPrinter.new

      my_account.deposit(100000)
      Timecop.travel(Time.local(2012, 01, 13))
      my_account.deposit(200000)
      Timecop.travel(Time.local(2012, 01, 14))
      my_account.withdraw(50000)
      Timecop.freeze(Time.local(2012, 01, 10))

      expect { terminal_printer.print_statement(my_account.statement) }.to output("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00\n13/01/2012 || 2000.00 || || 3000.00\n14/01/2012 || || 500.00 || 2500.00\n").to_stdout
    end
  end
end
