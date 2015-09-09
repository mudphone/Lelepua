defmodule LelepuaTest do
  use ExUnit.Case
  import Lelepua

  def div3(x, y, z \\ 3), do: x / y / z
  
  test "pipe-right" do
    assert 2 ~>> div(4) == 2.0
  end

  test "pipe-right with default parameters" do
    assert 3 ~>> div3(9) == 1.0
    assert 9 ~>> div3(9, 1) == 1.0
  end
  
end
