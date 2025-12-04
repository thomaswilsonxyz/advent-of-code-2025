require_relative './product_id_range.rb'

grand_total = File.read('./ranges.txt')
  .split(',')
  .map { |range_string| ProductIdRange.new(range_string) }
  .map { |product_id_range| product_id_range.invalid_product_ids.map(&:to_i).sum }
  .sum()

puts "Grand Total: #{grand_total}"
