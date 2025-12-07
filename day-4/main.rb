require_relative './storage.rb'

text = File.read("./input.txt")

paper_storage = PaperStorage.new(text)

puts "Accessible Paper Rolls: #{paper_storage.accessible_spaces.size}"
