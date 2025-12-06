require_relative "./bank_array.rb"

input = File.read("./input.txt")

bank_array = BankArray.new(input)

puts "Total output joltage: #{bank_array.total_output_joltage(false)}"
puts "Total (ignoring safety): #{bank_array.total_output_joltage(true)}"
