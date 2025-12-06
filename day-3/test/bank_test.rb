require 'minitest/autorun'
require_relative '../bank.rb'

class TestBank < Minitest::Test 
  def test_initialize 
    bank = Bank.new("012345")

    assert_equal "012345", bank.to_s
  end

  def test_get_max_value_simple
    bank = Bank.new("119911")

    assert_equal 99, bank.largest_possible_joltage(false)
  end

  def test_max_value_is_at_end
    bank = Bank.new("89")

    assert_equal 89, bank.largest_possible_joltage(false)
  end

  def test_eight_then_many_ones_then_a_nine
    bank = Bank.new("811111111111119")

    assert_equal 89, bank.largest_possible_joltage(false)
  end

  def test_safety_override
    bank = Bank.new("987654321111111")
    second_bank = Bank.new("234234234234278")
    third_bank = Bank.new("818181911112111")

    assert_equal 987654321111, bank.largest_possible_joltage(true)
    assert_equal 434234234278, second_bank.largest_possible_joltage(true)
    assert_equal 888911112111, third_bank.largest_possible_joltage(true)
  end

  def test_safety_override_trailing_9
    bank = Bank.new("811111111111119")
    assert_equal 811111111119, bank.largest_possible_joltage(true)
  end
end
