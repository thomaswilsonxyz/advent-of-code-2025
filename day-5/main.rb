require_relative './file_parser.rb'

content = FileParser.new(File.read("./input.txt"))

count = content.product_id_range_collection.contains_how_many? content.product_ids

puts "#{count} of #{content.product_ids.size} Product IDs are Fresh\n"
puts "#{content.product_id_range_collection.fresh_product_id_count} unique products are considered Fresh"

