require_relative './bank.rb'

class BankArray 
  attr_reader :banks

  def initialize(line_separated_bank_string)
    @banks = line_separated_bank_string
      .lines
      .map { |line| Bank.new(line.chomp())  }
  end

  def total_output_joltage(override_safety)
    @banks.map {|b| b.largest_possible_joltage(override_safety)}.sum()
  end
end
