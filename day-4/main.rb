require_relative './storage.rb'

text = File.read("./input.txt")

paper_storage = PaperStorage.new(text)

# Pt. 1:
# puts "Accessible Paper Rolls: #{paper_storage.accessible_spaces.size}"

# Pt. 2:
puts "Total number of removeable paper rolls: #{paper_storage.recursively_remove_all_available_rolls()}"
