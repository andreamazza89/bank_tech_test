describe TerminalPrinter do

  let(:my_account)       { instance_double('Account', statement: []) }
  let(:terminal_printer) { subject }

  describe '#print_statement' do

    context "when input argument is a brand new account's statement" do
      it 'prints an empty statement to the console' do
        expect { terminal_printer.print_statement(my_account.statement) }.to output("date || credit || debit || balance\n").to_stdout
      end
    end

    context 'when input argument is an account with one transaction' do

      it 'prints the appropriate output' do
        allow(my_account).to receive(:statement) { [{ date: Time.now, amount: 100000 }] }
        expect { terminal_printer.print_statement(my_account.statement) }.to output("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
      end

    end

    context 'when input argument is an account with a few transactions' do

      it 'prints the appropriate output' do
        allow(my_account).to receive(:statement) { [{ date: Time.now, amount: 100000 }, { date: Time.local(2012, 01, 13), amount: 200000 }, { date: Time.local(2012, 01, 14), amount: -50000 } ] }
        expect { terminal_printer.print_statement(my_account.statement) }.to output("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
      end

    end
  end
end
