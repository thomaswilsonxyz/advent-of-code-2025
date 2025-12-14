# Advent of Code 2025 - Day 5

## Problem Summary 

This problem is about parsing a file which has two sections: one representing a series of (possibly overlapping) ranges of numbers; the other representing a set of numbers.  The challenge is to determine how many of that second set of numbers occur in/out of the ranges specified previously.

Breaking this down I think we have some clear classes/entities: 

- `ProductIdRange` represents an (inclusive) range of numeric product IDs (which are integers)
- `ProductIdRangeCollection`  could represent a list or array of `ProductIdRange`s. 
- (can probably leave as a String) `ProductId` represents a single product ID.

Taking a first hash at API design, focused around the problem/domain, we'd want something like:

```rb
# Top-level logic
product_id_range_collection.contains? 1

# Implementation logic...
def contains?(a_product_id)
   @product_id_ranges.any? { |range| range.contains? a_product_id }.nil?
end
```

## Reflections

Solving pt. i of this challenge felt relatively simple. 

This was the first problem where I ended up building a specific `FileParser` class, because the input contained _two_ kinds of information.  

I kept the testing for pt. i very high level - not testing each individual implementation of each function, but rather just testing the higher level behaviour.  Although not "pure" TDD (i.e. there _is_ code which isn't covered by a unit test) - the flow felt quite nice.  

Tests saved my bacon once or twice, as I refactored some comparison logic.

### Pt. 2

This challenges was the first part that taught me something new in this Advent of Code.  The challenge is to find the total number of _unique_ numbers which are given within a set of ranges.  For example:

```
1-10
5-10
100-110
```

Will return `21` unique numbers(`1-10 => 10` and `100-110 => 11`), but there is an overlapping set of numbers which are covered in two ranges (`5-10`).  

Mathematially quite simple, however the problem input has large number, e.g. `306,348,303,280,454`.  To iterate through these ranges of large number, we would need to _materialise_ the numbers in a range, which means they would need to live _somewhere_ in memory.  

This means that a solution like...

```rb
require 'set'

product_ids_set = [].to_set

ProductIdRangeCollection.new("500-1000\n5000-5001")
  .product_id_ranges
  .map  { |range| (range.low..range.high) }
  .each { |range| range.each { |product_id| product_ids_set.add(product_id) }
```

Simply wouldn't work, because we'd be enumerating over such large number spaces.

Instead, I sorted the ranges of Product IDs from those with the lowest starting number, and aggregated them into chunks, the find the size of each of those chunks.  To do this, I used Ruby's native [Range](https://ruby-doc.org/3.4.1/Range.html) which has a `:count` method. 

The solution itself was quite simple, but the process of getting there and learning was nice.
