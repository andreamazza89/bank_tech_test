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
      expect { terminal_printer.print_statement(my_account) }.to output("date || credit || debit || balance\n").to_stdout
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

  end
end
