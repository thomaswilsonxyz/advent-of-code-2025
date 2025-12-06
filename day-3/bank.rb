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

  def largest_possible_joltage 
    largest_value = get_largest_joltage
    
    if largest_value[:index] == @int_values.size - 1
      largest_value = get_second_largest_joltage
    end

    second_largest_value = get_largest_value_after_index(largest_value[:index])

    "#{largest_value[:value]}#{second_largest_value[:value]}".to_i
  end

  private 

  def get_largest_joltage
    Bank.make_value_index_obj(@int_values, @int_values.max)
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
