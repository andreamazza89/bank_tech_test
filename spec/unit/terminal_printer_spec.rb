#Understands how to print account information into the the console
describe TerminalPrinter do

  describe '#print_statement' do
    context 'when input argument is a brand new account' do
      it 'prints an empty statement to the console' do
        my_account = Account.new 
        terminal_printer = TerminalPrinter.new
        expect { terminal_printer.print_statement(my_account) }.to output("date || credit || debit || balance\n").to_stdout
      end
    end
  end
end
