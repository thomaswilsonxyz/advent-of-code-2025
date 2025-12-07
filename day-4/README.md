# Day 4

## Problem Description 

Today's challenge is about finding slots on some shelf storage which have a set number of free (>5=; or conversely no more than 3 occupied) spaces in the adjacent spaces

## Technical Solution 

I'm going to use Ruby.

Reflecting on yesterday's implementation, I'm going to try to lean more into Object Oriented code, not just methods on classes.  I.e. have classes that represent something about the real world.  And in this real world i am helping the elves decorate the north pole ahead of Christmas.  So who's to say

## Reflections

When solving Day 3 I felt as though I kept the business logic too close to the implementation. That is: I felt as though I was operating over an array of characters representing something.  

In solving this challenge, I felt as though I was building data structures that actually modelled the problem space (i.e. modelling storage compartments in a giant 2D matrix).

The result was that the time from writing a test to having it pass was much quicker, and also the number of regressions that my tests caught was a lot lower.  The result was code that felt very responsible for individual parts of logic: the `PaperStorage` class was responsible for determining coordinates on a grid, and the `Shelf` class could get me details about individual spaces on that shelf.

The most complicated (i.e. verbose) problem I encountered was the generation of coordinates surrounding a given space.  Given that I just needed to test the observable behaviour of this code (i.e. can I get a list of available spaces on a whole storage?), and not the implementation, I was able to keep this method private, and just step through it.

The choice to keep my coordinates as `shelf_index` and `space_index` rather than `y` and `x` respectively feels like a step away from abstraction, and towards specific problem modelling


