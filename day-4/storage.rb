require_relative './shelf.rb'
require 'pry'

class PaperStorage 
  attr_reader :shelves

  def initialize(as_text)
    lines = as_text.lines
    @shelves = []

    (0..lines.size-1).each do |line_index|
      @shelves.push(Shelf.new(lines[line_index], line_index))
    end
  end

  def shelf_at(the_index)
    @shelves[the_index]
  end

  def accessible_spaces
    maximum_occupied_space_threshold = 3
    @shelves.map(&:occupied_spaces).flatten.select do |space|
      occupied_adjacent_count = occupied_spaces_adjacent_to(space[:shelf_index], space[:index]).size
      occupied_adjacent_count <= maximum_occupied_space_threshold
    end
  end

  def occupied_spaces 
    @shelves
      .map { |shelf| shelf.occupied_spaces }
      .flatten
  end


  def recursively_remove_all_available_rolls
    sum = 0
    while accessible_spaces.size > 0 
      sum += accessible_spaces.size
      remove_all_accessible_rolls
    end
    sum
  end

  private 

  def remove_all_accessible_rolls
    accessible_spaces.each { |space| remove_roll(the_space) }
  end

  def remove_roll(the_space)
    shelf_at(the_space[:shelf_index]).remove_roll(the_space[:index])
  end

  def get_space_on_shelf(the_shelf_index, the_space_index)
    shelf = shelf_at(the_shelf_index)
    space = shelf.space_at(the_space_index)
  end

  def get_adjacent_coordinates_for(the_shelf_index, the_space_index)
    all_combinations = []

    the_shelf_indices = (the_shelf_index-1..the_shelf_index+1)
    the_space_indices = (the_space_index-1..the_space_index+1)

    the_shelf_indices.each do |shelf_index|
      next if shelf_index < 0 or shelf_index >= @shelves.size
      the_space_indices.each do |space_index|
        next if space_index < 0 or space_index >= @shelves[shelf_index].spaces.size
        next if shelf_index == the_shelf_index and space_index == the_space_index

        all_combinations.push({
          shelf_index: shelf_index,
          space_index: space_index
        })

      end
    end

    return all_combinations
  end

  def occupied_spaces_adjacent_to(the_shelf_index, the_space_index)
    the_coordinates = get_adjacent_coordinates_for(the_shelf_index, the_space_index)

    all_spaces = the_coordinates.map { |the_coordinates| get_space_on_shelf(
      the_coordinates[:shelf_index],
      the_coordinates[:space_index]
    )}

    all_spaces.select { |space| space[:is_occupied] }
  end
end
