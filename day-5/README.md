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
