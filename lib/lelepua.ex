defmodule Lelepua do

  @doc """
    Much like the standard pipe operator `|>`, but threads the value
    resulting from evaluation of the left-hand expression into the
    position after the last given argument in the right-hand 
    expression's function call.
    
    ## Examples
        # Assuming `div` is defined like so:
        # def div(x, y), do: x / y
        # 
        # Note: The standard pipe operator `|>` would return 0.5
        #       in the example below.
  
        iex> 2 ~>> div(4)
        2.0

  """
  defmacro left ~>> right do
    [{h, _}|t] = Macro.unpipe({:|>, [], [left, right]})
    :lists.foldl fn
      {{_, _, args} = x, _pos}, acc ->
        pos = Enum.count(args)
        Macro.pipe(acc, x, pos)
      {x, pos}, acc ->
        Macro.pipe(acc, x, pos)
    end, h, t
  end

end
