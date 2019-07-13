# Lelepua
Playing with the arrow operator for Elixir, heavily inspired by its own pipe and Clojure threading macros.

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


## The Future

I'd like to take a look at implementing the [Swiss Arrows](https://github.com/rplevy/swiss-arrows) ideas from Robert Levy's Clojure library.

Right now this is just a bit of fooling around.

## A note about the name

`Lelepua` is the Hawaiian word for **arrow flight**. Or, at least it is according to [the internet](http://scienceviews.com/islands/hawaiianglossary.html).

## License

This code is available under the MIT License. Please see the LICENSE file.
