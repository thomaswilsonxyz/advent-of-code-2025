class Shelf 
  attr_reader :spaces
  attr_reader :index

  def initialize(the_shelf_text, the_index)
    @index = the_index
    chars = the_shelf_text.chomp().chars()
    spaces = []

    chars.each_index do |index|
      spaces.push({
        index: index,
        shelf_index: @index,
        is_occupied: chars[index] == '@'
      })
    end

    @spaces = spaces
  end

  def space_at(the_index)
    @spaces[the_index]
  end

  def occupied_spaces
    @spaces.select { |space| space[:is_occupied] }
  end

  def remove_roll(the_space_index)
    the_space = @spaces.find { |space| the_space_index == space[:index] }

    raise "Space #{the_space_index} on Shelf #{index} does not exist" if the_space.nil?

    raise "Space at #{the_space_index} on shelf #{@index} is not occupied" unless the_space[:is_occupied]

    # ...probably should have made a Space or ShelfSpace class, but in-line hash modifications will do for now
    the_space.merge! the_space, { is_occupied: false }
  end
end
