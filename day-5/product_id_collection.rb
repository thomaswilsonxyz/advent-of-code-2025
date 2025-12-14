require 'pry'
require_relative './product_id_range.rb'

# Represents a collection of (possibly overlapping) product IDs
class ProductIdRangeCollection
  def initialize(the_new_line_separated_ranges)
    @ranges = the_new_line_separated_ranges.lines.map { |line| ProductIdRange.new line }
  end

  def product_id_ranges
    @ranges
  end

  def contains? (a_product_id)
    @ranges.any? { |range| range.contains? a_product_id.to_i }
  end

  def contains_how_many? (a_list_of_product_ids)
    a_list_of_product_ids.count { |id| contains?(id) }
  end

  # @return Integer
  def fresh_product_id_count
    total_covered_range = 0

    sorted_ranges = @ranges.sort { |a, b| a.low <=> b.low }
    current_low = sorted_ranges.first.low
    current_high = sorted_ranges.first.high

    sorted_ranges.each do |current_range|
      if current_range.low > current_high
        total_covered_range += (current_low..current_high).count
        current_low = current_range.low
        current_high = current_range.high
        next
      end

      current_high = [current_high, current_range.high].max
      current_low = [current_low, current_range.low].min
    end

    total_covered_range + (current_low..current_high).count
  end
end
