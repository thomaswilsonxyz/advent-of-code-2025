class Lock 
  attr_reader :currently_pointing_to
  attr_reader :passed_zero_count
  attr_reader :ended_at_zero_count

  def initialize
    @currently_pointing_to = 50
    @passed_zero_count = 0
    @ended_at_zero_count = 0
    @turn_count = 0
    @click_count = 0
  end

  def make_multiple_turns(line_separated_instructions)
    line_separated_instructions.each_line { |v| turn(v) }
  end

  def turn(the_move_description)
    direction = the_move_description[0]
    distance = the_move_description[1..].to_i

    validate_direction(direction)
    validate_distance(distance)

    if direction == "R"
      move_the_dial(distance.abs())
    elsif direction == "L"
      move_the_dial(-distance)
    end
  end

  def print_summary 
    puts("Summary for lock:")
    puts("\tNumber of moves ending at zero: #{@ended_at_zero_count}...")
    puts("\tYou left the lock pointing at at #{@currently_pointing_to}.")
    puts("\t...And you went past zero #{@passed_zero_count} times.")
    puts("\tYou turned the lock #{@turn_count} times")
    puts("\t...which was #{@click_count} individual *click*s")
  end

  private 

  def validate_direction(as_string) 
    throw "Direction is invalid" unless ["R", "L"].include?(as_string)
  end

  def validate_distance(as_i)
    throw "Distance is invalid" if as_i.nil?
  end

  def move_the_dial(the_delta)
    the_proposed_number = @currently_pointing_to + the_delta

    while the_proposed_number < 0 do 
      the_proposed_number = the_proposed_number + 100
      @passed_zero_count += 1
    end
    
    while the_proposed_number >= 100 do
      the_proposed_number = the_proposed_number - 100
      @passed_zero_count += 1
    end

    @currently_pointing_to = the_proposed_number
    @ended_at_zero_count += 1 if @currently_pointing_to == 0
    @turn_count += 1
    @click_count += the_delta.abs()
  end
end

