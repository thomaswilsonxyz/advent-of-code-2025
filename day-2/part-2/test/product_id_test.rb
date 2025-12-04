require 'minitest/autorun'
require_relative '../product_id.rb'

class ProductIdTest < Minitest::Test 

  def test_two_characters
    the_product_id = ProductId.new("12")
    assert the_product_id.valid?
  end

  def test_four_characters
    the_product_id = ProductId.new("1234")
    assert the_product_id.valid?
  end

  def test_long_string
    the_product_id = ProductId.new("3576243785627461736471543658791637485163451356678193")
    assert the_product_id.valid?
  end

  def test_one_character_repeat 
    the_product_id = ProductId.new("11")

    assert_equal false, the_product_id.valid?, "The id '11' is not valid"
  end

  def test_three_times_repeat_is_not_valid
    the_product_id = ProductId.new("121212")

    refute the_product_id.valid?
  end

  def test_two_character_repeat
    the_product_id = ProductId.new("1212")
    assert_equal false, the_product_id.valid?, "The id '1212' should be invalid as it repeats"
  end
  
  def test_eight_character_repeat
    the_product_id = ProductId.new("1234567812345678")
    assert_equal false, the_product_id.valid?, "The id with 2x8 repeating string should be invalid as it repeats"
  end

  def test_to_i 
    the_product_id = ProductId.new("105")
    assert_equal 105, the_product_id.to_i
  end
end
