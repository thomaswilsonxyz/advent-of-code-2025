# Day #1 

This challenge was about modelling one of those dial locks, and the twisting of the dial left and right.

I chose to solve today's problem in Ruby.  About a decade ago I was writing Ruby every day, and it's nice to have an excuse to pick it back up.  It's a nifty little scripting language, and I'm glad of the chance to use it again. 

I took a Test Driven Development approach to solving this problem, using the [minitest](https://www.rubydoc.info/gems/minitest/) gem.  Getting a good TDD flow always feels good, and also helps break down familiar problems into their unfamiliar ruby syntax.

I love how many little utilities the Ruby classes give you.  Where I reached for

```rb
text.split("\n").for_each { |line| turn(line) }
```

I realise this is a direct translation of the JS:

```js
text.split('\n').forEach((v) => this.turn(v))
```

Ruby lets you just:

```rb
text.each_line { |line| turn(line) }
```

I'm not committing to using this language every day, but it was a reminder of how the "batteries included" OOP helped me munge through the problem pretty quickly.

I do _not_ miss having to parse Ruby's documentation style (e.g. finding the `each_line` method on the [String documentation](https://ruby-doc.org/3.4.1/String.html#method-i-each_line)).  Call me impatient, I don't read docs _before_ solving the problem, to have an ambient awareness.

--Wilson, 2025-12-03T22:05Z
