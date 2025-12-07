require 'minitest/autorun'
require_relative '../shelf.rb'

class TestShelf < Minitest::Test 
  def setup
    @simple_shelf = Shelf.new("..@..", 0)
  end

  def test_create_shelf 
    assert_equal 5, @simple_shelf.spaces.size
    assert_equal 0, @simple_shelf.index
  end

  def test_occupied
    assert @simple_shelf.space_at(2)[:is_occupied]
  end

  def test_get_occupied_spaces
    assert_equal [{
      is_occupied: true, 
      shelf_index: 0,
      index: 2
    }], @simple_shelf.occupied_spaces
  end


end
