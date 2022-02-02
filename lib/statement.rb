# frozen_string_literal: true

require_relative 'account'

class Statement
  def header
    'date || credit || debit || balance'
  end

  def print(transactions)
    puts header
    transactions.reverse.each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    end
  end
end
