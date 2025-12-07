require 'minitest/autorun'
require_relative '../storage.rb'

class TestStorage < Minitest::Test 
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
end
