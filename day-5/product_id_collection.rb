require 'pry'
require_relative './product_id_range.rb'

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
end
