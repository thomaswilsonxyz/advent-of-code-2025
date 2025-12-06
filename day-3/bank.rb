require 'pry'

class Bank 
  attr_reader :joltage_value_string
  attr_reader :int_values

  def initialize(joltage_value_string)
    @joltage_value_string = joltage_value_string
    @int_values = @joltage_value_string.chars.map(&:to_i)
  end

  def to_s
    @joltage_value_string
  end

  def largest_possible_joltage(override_safety)
    if !override_safety 
      largest_value = get_largest_joltage
      
        if largest_value[:index] == @int_values.size - 1
        largest_value = get_second_largest_joltage
      end

      second_largest_value = get_largest_value_after_index(largest_value[:index])

      return "#{largest_value[:value]}#{second_largest_value[:value]}".to_i
    end
    
    return largest_possible_number_with_digits(12)
  end

  private 


  def get_largest_joltage
    Bank.make_value_index_obj(@int_values, @int_values.max)
  end

  def largest_possible_number_with_digits(the_count)
    throw "Not enough Batteries in the bank (#{@int_values.size}) to make number with #{the_count} digits" unless the_count <= @int_values.size

    return @int_values.join('').to_i unless @int_values.size > the_count

    # Get a list of possible first values, which have enough space to the right

    # 1. Take all possible values 
    possible_digits = @int_values
    starting_digit_index = 0
    answer = []

    (0..the_count-1).to_a.reverse.each do |remaining_digit_count|
      # 2. Just find me the values I _could_ choose (i.e. those with enough digits after them that I can make my target)
      eligable_digits = possible_digits.slice(
        # +1 to counteract the 0-based index, but 1-based size
        starting_digit_index..possible_digits.size - (remaining_digit_count + 1)
      )

      # 3. Find the maximum of those eligable digits and take that, then increment the starting index 
      # +1 to counteract "what if we're at the first digit?"
      maximum_eligable_digit = eligable_digits.max 
      starting_digit_index += eligable_digits.find_index(maximum_eligable_digit) + 1

      # 4. Pass on a new list of digits which is the list i was given from one after the number i just selected 
      answer.push(maximum_eligable_digit)
    end

    answer.join('').to_i
  end

  def get_second_largest_joltage
    Bank.make_value_index_obj(
      @int_values, 
      @int_values.uniq.sort.reverse[1]
    )
  end

  def get_largest_value_after_index(the_index)
    the_array = @int_values.slice(the_index+1..)
    the_value = the_array.max
    Bank.make_value_index_obj(the_array, the_value)
  end

  def self.make_value_index_obj(the_array, the_value)

    {
      :value => the_value, 
      :index => the_array.find_index(the_value)
    }
  end

end
