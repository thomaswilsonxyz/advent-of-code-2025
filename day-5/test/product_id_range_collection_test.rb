require 'minitest/autorun'
require_relative '../product_id_collection.rb'

class TestProductIdRangeCollection < Minitest::Test
  def setup
    @range = ProductIdRangeCollection.new "3-5\n4-6"
  end

  def test_contains_lowest_digit
    assert @range.contains? 3
  end

  def test_contains_highest_digit
    assert @range.contains? 6
  end

  def test_does_not_contain
    refute @range.contains? 2
    refute @range.contains? 7
  end

  def test_contains_count
    assert_equal 1, @range.contains_how_many?([1,2,3])
  end

  # pt. ii
  def test_fresh_product_id_count
    # [3,4,5,6]
    assert_equal 4, @range.fresh_product_id_count
  end

  def test_fresh_product_id_count_with_non_overlapping_ranges
    # 1-10 => 10
    # 100-110 => 11
    # total: 20
    range_collection = ProductIdRangeCollection.new "1-10\n100-110"
    assert_equal 21, range_collection.fresh_product_id_count
  end
end
