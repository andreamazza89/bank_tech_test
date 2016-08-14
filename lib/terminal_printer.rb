#Understands how to print account information as a string into the injected output stream
class TerminalPrinter

  def initialize(output = STDOUT)
    @output = output
  end

  def print_statement(statement)
    @output.puts HEADER + stringify_statement(statement)
  end

private
  
  def stringify_statement(statement)
    formatted_statement = statement.map.with_index do |transaction, index|
      date      = transaction[:date].strftime('%d/%m/%Y')
      credit    = transaction[:amount] >= 0 ? convert_pennies_to_pounds(transaction[:amount]) : '' 
      debit     = transaction[:amount] < 0  ? convert_pennies_to_pounds(transaction[:amount]) : '' 
      balance   = calculate_balance(statement[0..index])
      balance   = convert_pennies_to_pounds(balance)
      separator = " || "
      (date + separator + credit + separator + debit + separator + balance + "\n").squeeze(' ')
    end
  
    formatted_statement.reverse.join
  end

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

  HEADER = "date || credit || debit || balance\n" 

end
