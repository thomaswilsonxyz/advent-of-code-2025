require 'minitest/autorun'
require_relative '../storage.rb'


class TestStorage < Minitest::Test 
  def setup
    @one_roll_in_centre_text = ".....\n..@..\n....."
    
    # @@@@@
    # .@@@.
    # .....
    @rolls_on_top_shelf = "@@@@@\n.@@@.\n....."
  end

  def test_create_storage 
    text = ".....\n.....\n....."
    paper_storage = PaperStorage.new text
    
    assert_equal 3, paper_storage.shelves.size
    assert_equal 5, paper_storage.shelf_at(0).spaces.size
  end

  def test_get_empty_adjacent_spaces
    # @@@..
    # .@@..
    # .....
    text = "@@@..\n.@@..\n....."

    paper_storage = PaperStorage.new text

    assert_equal 3, paper_storage.accessible_spaces.size
  end

  def test_combination_given_in_docs
    text = "..@@.@@@@.
@@@.@.@.@@
@@@@@.@.@@
@.@@@@..@.
@@.@@@@.@@
.@@@@@@@.@
.@.@.@.@@@
@.@@@.@@@@
.@@@@@@@@.
@.@.@@@.@."

    paper_storage = PaperStorage.new(text)

    assert_equal 13, paper_storage.accessible_spaces.size
  end

  def test_remove_all_possible_rolls 
    paper_storage = PaperStorage.new(@rolls_on_top_shelf)

    assert_equal 8, paper_storage.occupied_spaces.size

    rolls_removed_count = paper_storage.recursively_remove_all_available_rolls()

    assert_equal 0, paper_storage.occupied_spaces.size
    assert_equal 8, rolls_removed_count
  end
end
