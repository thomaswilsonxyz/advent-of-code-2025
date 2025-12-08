# Day 4

## Problem Description 

Today's challenge is about finding slots on some shelf storage which have a set number of free (>5=; or conversely no more than 3 occupied) spaces in the adjacent spaces

## Technical Solution 

I'm going to use Ruby.

Reflecting on yesterday's implementation, I'm going to try to lean more into Object Oriented code, not just methods on classes.  I.e. have classes that represent something about the real world.  And in this real world i am helping the elves decorate the north pole ahead of Christmas.  So who's to say

## Reflections

### Pt. i

When solving Day 3 I felt as though I kept the business logic too close to the implementation. That is: I felt as though I was operating over an array of characters representing something.  

In solving this challenge, I felt as though I was building data structures that actually modelled the problem space (i.e. modelling storage compartments in a giant 2D matrix).

The result was that the time from writing a test to having it pass was much quicker, and also the number of regressions that my tests caught was a lot lower.  The result was code that felt very responsible for individual parts of logic: the `PaperStorage` class was responsible for determining coordinates on a grid, and the `Shelf` class could get me details about individual spaces on that shelf.

The most complicated (i.e. verbose) problem I encountered was the generation of coordinates surrounding a given space.  Given that I just needed to test the observable behaviour of this code (i.e. can I get a list of available spaces on a whole storage?), and not the implementation, I was able to keep this method private, and just step through it.

The choice to keep my coordinates as `shelf_index` and `space_index` rather than `y` and `x` respectively feels like a step away from abstraction, and towards specific problem modelling

### Pt. ii

I got some nice vindication that my object-oriented approach was relatively sensible in this part.  I was able to evolve my API quite nicely through a couple of methods (each of which became sequentially `private` in the `PaperStorage` class) - and was left with some methods which read quite nicely - and also which translate pretty cleanly to some of Ruby's native methods. 

Doing this in a test-driven way felt painless, and working with the hash data structures seemed to work. 

I was a little concerned that passing both self _and_ space index information down to the Space data structure was leaking knowledge to where it wasn't necessary.  I.e. should a single space be able to say "I am space 2 on shelf 5", or should it simply say "I am space 5".  Ultimately, the pragmatism of informing the space of both its shelf and space (i.e. `x` _and_ `y` coordinates) helped keep the code itself really quite readable.

The Day 3 challenge felt quite frustrating at times, and keeping my code grounded in the "real life" problem domain helped evolve my thinking really smoothly.

Part of me wonders if I needed a `Shelf` class, as having to do some manual `hash.merge!` on the data structure as part of the implementation suggests that having a `Space::remove_roll()` method might be _more_ object oriented. 


