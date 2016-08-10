#Understands how to print account information into the the console
class TerminalPrinter

  HEADER = "date || credit || debit || balance\n" 

  def print_statement(statement)
    if statement.empty?
      formatted_statement = ['']
    else
      formatted_statement = statement.map.with_index do |transaction, index|
        date       = transaction[:date].strftime('%d/%m/%Y')
        credit     = transaction[:amount] >= 0 ? convert_pennies_to_pounds(transaction[:amount]) : '' 
        debit      = transaction[:amount] < 0  ? convert_pennies_to_pounds(transaction[:amount]) : '' 
        balance    = calculate_balance(statement[0..index])
        balance    = convert_pennies_to_pounds(balance)
        separator  = " || "
        (date + separator + credit + separator + debit + separator + balance + "\n").squeeze(' ')
      end
    end
    
    print HEADER + formatted_statement.join
  end

private

  def convert_pennies_to_pounds(amount)
    amount = amount.abs.to_s
    case amount.length
      when 1
        return "0.0" + amount
      when 2
        return "0." + amount
      else
        return amount[0..-3] + "." + amount[-2..-1]
    end
  end

  def calculate_balance(transactions_to_date)
    transactions_to_date.reduce(0) { |balance, transaction| balance += transaction[:amount] }
  end

end
