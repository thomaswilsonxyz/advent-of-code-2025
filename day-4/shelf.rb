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
end
