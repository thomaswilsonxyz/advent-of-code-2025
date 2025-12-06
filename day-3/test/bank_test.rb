require 'minitest/autorun'
require_relative '../bank.rb'

class TestBank < Minitest::Test 
  def test_initialize 
    bank = Bank.new("012345")

    assert_equal "012345", bank.to_s
  end

  def test_get_max_value_simple
    bank = Bank.new("119911")

    assert_equal 99, bank.largest_possible_joltage
  end

  def test_max_value_is_at_end
    bank = Bank.new("89")

    assert_equal 89, bank.largest_possible_joltage
  end

  def test_eight_then_many_ones_then_a_nine
    bank = Bank.new("811111111111119")

    assert_equal 89, bank.largest_possible_joltage
  end
end
