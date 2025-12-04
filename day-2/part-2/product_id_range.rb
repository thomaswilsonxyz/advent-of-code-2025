require_relative './product_id.rb'

class ProductIdRange 
  attr_reader :from_number
  attr_reader :to_number
  
  def initialize(the_range_string)
    (from,to) = the_range_string.split("-")
    @from_number = from.to_i
    @to_number = to.to_i
  end

  def product_ids
    (@from_number..@to_number).map { |i| ProductId.new(i.to_s)}
  end

  def invalid_product_ids
    product_ids.reject(&:valid?) 
  end
end
