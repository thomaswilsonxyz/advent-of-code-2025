require_relative './product_id_collection.rb'

class FileParser 
  def initialize(the_text)
    ranges, product_ids = the_text.split("\n\n")

    @product_id_range_collection = ProductIdRangeCollection.new ranges
    @product_ids = product_ids.lines.map(&:to_i)
  end

  def product_ids 
    @product_ids
  end

  def product_id_range_collection
    @product_id_range_collection 
  end

  def product_id_ranges 
    @product_id_range_collection.product_id_ranges 
  end
end
