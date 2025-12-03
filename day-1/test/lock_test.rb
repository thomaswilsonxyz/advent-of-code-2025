require "minitest/autorun"
require_relative "../lock"

class TestLock < Minitest::Test 
  def setup 
    @lock = Lock.new 
  end 

  def test_is_pointing_to_zero
    assert @lock.is_pointing_to_zero? 
  end

  def test_turning_to_the_right
    @lock.turn("R1")
    assert_equal @lock.currently_pointing_to, 51, "Lock should be pointing at 1"
  end

  def test_turning_to_the_left 
    @lock.turn("L1")
    assert_equal @lock.currently_pointing_to, 49, "Lock should go from 0 to 99"
    assert_equal @lock.ended_at_zero_count, 0
  end

  def test_overclocking_left_to_zero
    @lock.turn("L50")
    assert_equal @lock.currently_pointing_to, 0
    assert_equal @lock.ended_at_zero_count, 1
  end

  def test_overclocking_right_to_zero
    @lock.turn("R50")
    assert_equal @lock.currently_pointing_to, 0
  end

  def test_number_greater_than_100
    @lock.turn("R200")
    assert_equal 50, @lock.currently_pointing_to
    assert_equal 0, @lock.ended_at_zero_count
  end

  def test_number_greater_than_100
    @lock.turn("L101")
    assert_equal 49, @lock.currently_pointing_to
    assert_equal 0, @lock.ended_at_zero_count
  end

  def test_passing_zero_increments_a_count
    @lock.turn("L51")

    @lock.turn("R5")

    @lock.turn("L10")

    assert_equal @lock.passed_zero_count, 3, "The Lock should count each time is goes backwards past zero"
  end

  def test_reading_multiple_lines
    the_instructions = <<~EOT
    R1
    R1
    L1 
    L2
    EOT

    @lock.make_multiple_turns(the_instructions)

    assert_equal 49, @lock.currently_pointing_to, "The lock should be on 49 after turning R2 and L3"
  end
end

