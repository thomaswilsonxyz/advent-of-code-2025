require 'minitest/autorun'
require_relative '../product_id_range.rb'

class TestProductIdRange < Minitest::Test 
  def test_start_end_number 
    range = ProductIdRange.new("1-2")
    assert_equal 1, range.from_number
    assert_equal 2, range.to_number
  end

  def test_get_all_ids
    range = ProductIdRange.new("11-20")
    product_ids = range.product_ids 
    
    assert_equal 10, product_ids.size
    assert_equal false, product_ids[0].valid?
  end

  def test_get_all_invalid_ids
    range = ProductIdRange.new("11-22")
    second_range = ProductIdRange.new("1188511880-1188511890")

    assert_equal 2, range.invalid_product_ids.size
    assert_equal 1, second_range.invalid_product_ids.size
  end
end
