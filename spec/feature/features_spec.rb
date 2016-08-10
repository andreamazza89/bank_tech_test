describe 'Features' do

  context 'default' do

    #As a person with some money
    #So I can avoid storing all of my cash in the mattress
    #I want to open an account
################################################################################
    #As a bank
    #So I do not give away money
    #I want a brand new account to have no balance

    it 'User opens the account, #print_statement shows no transactions' do
      my_account = Account.new 
      terminal_printer = TerminalPrinter.new
      expect { terminal_printer.print_statement(my_account) }.to output("date || credit || debit || balance\n").to_stdout
    end
  end
end
