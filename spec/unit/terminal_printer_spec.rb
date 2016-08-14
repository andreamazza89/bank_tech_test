describe TerminalPrinter do

  let(:mock_console)     { spy('mock_console') }
  let(:my_account)       { instance_double('Account', statement: []) }
  let(:terminal_printer) { described_class.new(mock_console) }

  describe '#print_statement' do

    context "when input argument is a brand new account's statement" do
      it 'prints an empty statement to the console' do
        terminal_printer.print_statement(my_account.statement)
        expect(mock_console).to have_received(:puts).with("date || credit || debit || balance\n")
      end
    end

    context 'when input argument is an account with one transaction' do

      it 'prints the appropriate output' do
        allow(my_account).to receive(:statement) { [{ date: Time.now, amount: 100000 }] }
        terminal_printer.print_statement(my_account.statement)
        expect(mock_console).to have_received(:puts).with("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00\n")
      end

    end

    context 'when input argument is an account with a few transactions' do

      it 'prints the appropriate output' do
        allow(my_account).to receive(:statement) { [{ date: Time.now, amount: 100000 }, { date: Time.local(2012, 01, 13), amount: 200000 }, { date: Time.local(2012, 01, 14), amount: -50000 } ] }
        terminal_printer.print_statement(my_account.statement)
        expect(mock_console).to have_received(:puts).with("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n")
      end

    end
  end
end
