# Represents a single range of Product IDs
class ProductIdRange
  attr_reader :low, :high

  def initialize(the_hyphen_separated_ranges)
    low, high = the_hyphen_separated_ranges.split("-")
    @low = low.to_i
    @high = high.to_i
  end

  def contains?(a_product_id)
    a_product_id >= @low and a_product_id <= @high
  end

  def fresh_product_ids
    (@low..@high).to_a
  end

end
