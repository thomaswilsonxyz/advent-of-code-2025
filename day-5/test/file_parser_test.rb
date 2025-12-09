require 'minitest/autorun'
require_relative '../file_parser.rb'

class FileParserTest < Minitest::Test
  def setup 
    @file_content = FileParser.new "3-5
10-14
16-20
12-18

1
5
8
11
17
32"

  end

  def test_get_product_ids
    assert_equal [1, 5, 8, 11, 17, 32], @file_content.product_ids
  end

  def test_get_ranges
    assert_equal 4, @file_content.product_id_ranges.size
  end

end
