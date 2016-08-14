require 'time'
require 'timecop'

describe 'Features: printer' do

  let(:my_account)       { Account.new }
  let(:terminal_printer) { TerminalPrinter.new }

  #US1
  #US2
  it 'TerminalPrinter#print_statement shows no transactions for new account' do
    expect { terminal_printer.print_statement( my_account.statement) }
      .to output(HEADER).to_stdout_from_any_process
  end

  #US5
  it 'User deposits some money, #print_statement shows the transaction' do
    my_account.deposit(100000)

    expect { terminal_printer.print_statement(my_account.statement) }
      .to output(HEADER + FIRST_TRANSACTION).to_stdout_from_any_process
  end

  it 'User makes a few transactions, #print_statement shows the transactions' do
    my_account.deposit(100000)
    Timecop.travel(Time.local(2012, 01, 13))
    my_account.deposit(200000)
    Timecop.travel(Time.local(2012, 01, 14))
    my_account.withdraw(50000)
    Timecop.travel(Time.local(2012, 01, 10))

    expect { terminal_printer.print_statement(my_account.statement) }
      .to output(HEADER + THIRD_TRANSACTION + SECOND_TRANSACTION + FIRST_TRANSACTION).to_stdout_from_any_process
  end

  #These constants are both used here and in the unit tests, so they should be
  #exported to a separate file and required here
  HEADER             = "date || credit || debit || balance\n"
  FIRST_TRANSACTION  = "10/01/2012 || 1000.00 || || 1000.00\n"
  SECOND_TRANSACTION = "13/01/2012 || 2000.00 || || 3000.00\n"
  THIRD_TRANSACTION  = "14/01/2012 || || 500.00 || 2500.00\n"
  
end
