describe Account do

  let(:my_account) { subject }
  
  describe '#deposit' do
    it 'does not raise an error with valid input (integer pennies)' do
      expect { my_account.deposit(34500) }.to_not raise_error
    end
  end

  describe '#withdraw' do
    it 'does not raise an error with valid input (integer pennies)' do
      expect { my_account.withdraw(34500) }.to_not raise_error
    end
  end

end
