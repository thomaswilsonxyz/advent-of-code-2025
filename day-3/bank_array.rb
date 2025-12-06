require_relative './bank.rb'

class BankArray 
  attr_reader :banks

  def initialize(line_separated_bank_string)
    @banks = line_separated_bank_string
      .lines
      .map { |line| Bank.new(line.chomp())  }
  end

  def total_output_joltage 
    @banks.map(&:largest_possible_joltage).sum()
  end
end
