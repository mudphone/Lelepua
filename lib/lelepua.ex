defmodule Lelepua do

  @doc """
    Much like the standard pipe operator `|>`, but threads the value
    resulting from evaluation of the left-hand expression into the
    position after the last given argument in the right-hand 
    expression's function call.
    
    ## Examples
        # Note: The standard pipe operator `|>` would return 0.5
        #       in the example below.
  
        iex> 2 ~>> div(4)
        2.0

  """
  defmacro left ~>> right do
    # Assuming: 2 ~>> div(4)
    [{h, _}|t] = Macro.unpipe({:|>, [], [left, right]})
    # => [{2, 0}, {{:div, [line: 3], [4]}, 0}]
    
    # :lists.foldl is like: reduce(fn, initial_val, list)
    # consuming list from left to right (lowest to highest index)
    :lists.foldl fn
      # first clause matches fn calls
      {{_, _, args} = x, _pos}, acc ->
        # pos is one index higher than the last arg
        pos = Enum.count(args)
      Macro.pipe(acc, x, pos)

      # second clause matches terms (like an integer)
      {x, pos}, acc ->
        Macro.pipe(acc, x, pos)
    end, h, t
  end
end
