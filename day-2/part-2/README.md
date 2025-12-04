# Day 2

## Problem description
Today's challenge is about finding the number of `invalid` IDs within a range.  

`invalid` is defined as any number which has a repeating pattern.  E.g. `123123` or `11`.  

You then must add up all of the invalid IDs in a given range.

## Tech Choices 

I went for Ruby, adopting a TDD with Minitest (same as Day 1).

Again, leaning into Ruby's Object Oriented nature, I modelled an individual Product ID as a `ProductId`, and a possible range of Product IDs as a `ProductIdRange`.

Using Ruby's `File.read` syntax is enough to pass in the input.

## Reflections and Solution

I leaned a little more into Ruby's readability and _joy_, and I'm happy with what's come out of the end.  I am especially happy with how readable the code is. 

E.g., consider the following method that retrieves a list of the invalid Product IDs from a range:

```rb
def invalid_product_ids
  product_ids.reject(&:valid?) 
end
```

Even though it took a moment for Ruby to chug through the entire problem (several seconds on my (rapidly aging) M1 MacBook) - the conciseness of the code feels nice to read and write. 

Ruby' documentation (e.g. their [Array docs](https://ruby-doc.org/3.4.1/Array.html)) remain a little hard to discover or search - but I'm a bit more familiar with sorting through them now.

I had a good time working this one through.

I like how testing here makes me feel confident in refactoring.  E.g. swapping out the `:select { |id| !id.valid? }` method for the `:reject(:&valid?)` syntax was something I could be sure of because I had some good test coverage.

--Wilson 2025-12-04T13:00Z
