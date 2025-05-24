# I used recursion for loops in elixir because elixir does not have the traditonal while loops.
defmodule Counter do
  def count_down(0), do: IO.puts("Done!")
  def count_down(n) do
    IO.puts(n)
    count_down(n - 1)
  end
end

Counter.count_down(5)
