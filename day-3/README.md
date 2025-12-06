# Day 3

## Problem Description 

This problem, broadly, is about finding a sequence of "Batteries" (i.e. single-digit number) in a "Bank" of batteries (i.e.a string of single-digit numbers) that make the largest single number when they are appended together.  e.g. `"1"+"2"="12"`, not `1+2=3`.

### Part ii: Override safety

Now, as opposed to just combining two digits to make the biggest number, we do it with _twelve_

## Technical Choices

I continued using Ruby and test-driven development with Minitest.

## Design

I built two classes: `Bank` representing a series of Batteries in a row (e.g. `"012345"`).  This is the unit you operate on to find the "maximum output joltage".

To join a group of `Bank`s together, e.g. to get the sum maximum output joltage across a series of `Bank`s, I used a `BankArray`.

## Reflections 

I had a sneaky bug in my `BankArray` class, where the input text (which contains a set of line-separated) was having an empty/new-line character added to the end of each array.  This was falsely appending a `0` to the end of my integer array of joltage values.

For example: `12345\n12345` would give me the arrays `[1,2,3,4,5,0],[1,2,3,4,5]`.  I managed to identify this by looking at the docs for `String::lines` ([link](https://ruby-doc.org/3.4.1/String.html#method-i-lines)) and noticing the `chomp` argument which:

> Removes the trailing record separator, if found

This was an example of TDD giving me a heads-up to a problem, but also where I found Ruby's loose type system to get in the way of me debugging the flow of data.

This relatively poor debugging experience, so i think i want to take a focus on the tools available to make that easier (e.g. the [pry](https://github.com/pry/pry) gem) 


