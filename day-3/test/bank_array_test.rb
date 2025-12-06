require 'minitest/autorun'
require_relative '../bank_array.rb'

class TestBankArray < Minitest::Test 
  def test_create_bank_array 
    # Given
    text =  %{987654321111111\n811111111111119\n234234234234278\n818181911112111}
    bank_array = BankArray.new(text)

    # When
    assert_equal 4, bank_array.banks.size
    assert_equal 357, bank_array.total_output_joltage
  end
end
