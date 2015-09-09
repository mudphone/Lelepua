# Lelepua
A collection of arrow operators for Elixir, heavily inspired by its own pipe and Clojure threading macros.

## Arrows!

This is all I've got so far.

````elixir
                           defmacro ~>>(left, right)

Much like the standard pipe operator |>, but threads the value resulting from
evaluation of the left-hand expression into the position after the last given
argument in the right-hand expression's function call.

## Examples

┃   # Note: The standard pipe operator `|>` would return 0.5
┃   #       in the example below.
┃
┃   iex> 2 ~>> div(4)
┃   2.0
````
