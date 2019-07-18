defmodule Lelepua do

  @doc """
    Much like the standard pipe operator `|>`, but threads the value
    resulting from evaluation of the left-hand expression into the
    position after the last given argument in the right-hand 
    expression's function call.
    
    ## Examples
        # Note: The standard pipe operator `|>` would return 0
        #       in the first example below.
  
        iex> 2 ~>> div(4)
        2

        iex> 6 |> div(2) ~>> div(15)
        5

  """
  defmacro left ~>> right do
    [{h, _}|t] = unpipe({:~>>, [], [left, right]})
    
    :lists.foldl fn {x, pos}, acc ->
      Macro.pipe(acc, x, pos)
    end, h, t
  end
  
  def num_args({_, _, args}), do: Enum.count(args)
  
  def unpipe(expr) do
    :lists.reverse(unpipe(expr, 0, []))
  end

  defp unpipe({:~>>, _, [left, right]}, n, acc) do
    unpipe(right, num_args(right), unpipe(left, n, acc))
  end
  
  defp unpipe(other, n, acc) do
    [{other, n} | acc]
  end
end
