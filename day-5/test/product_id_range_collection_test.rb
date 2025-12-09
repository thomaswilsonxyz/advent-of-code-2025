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
end
