require 'time'
require 'timecop'

describe 'Features' do

  let(:my_account)       { Account.new }
  let(:terminal_printer) { TerminalPrinter.new }

  context 'default' do

    #US1
    #US2
    it 'User opens the account, TerminalPrinter#print_statement shows no transactions' do
      expect { terminal_printer.print_statement(my_account.statement) }.to output("date || credit || debit || balance\n").to_stdout_from_any_process
    end

    #US5
    it 'User opens the account, deposits some money, TerminalPrinter#print_statement shows the transaction with date' do
      my_account.deposit(100000)

      expect { terminal_printer.print_statement(my_account.statement) }.to output("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00\n").to_stdout_from_any_process
    end

    it 'User opens the account, makes a few transactions, TerminalPrinter#print_statement shows the transaction with date' do
      my_account.deposit(100000)
      Timecop.travel(Time.local(2012, 01, 13))
      my_account.deposit(200000)
      Timecop.travel(Time.local(2012, 01, 14))
      my_account.withdraw(50000)

      expect { terminal_printer.print_statement(my_account.statement) }.to output("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n").to_stdout_from_any_process
    end
  end

  
end
