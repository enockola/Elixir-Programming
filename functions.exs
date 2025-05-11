# Regular addition function
defmodule Math do # define a math module
  def add(a, b) do # define addition function
    a + b
  end
end # you must use the end command if your function spans multiple lines.

IO.puts Math.add(2, 3)

# Lamda addition functions
add = fn a, b -> a + b end
IO.puts add.(2, 3)  # prints 5

# Regular subtraction function
defmodule MyMath do
  def add(a, b), do: a + b
  def subtract(a, b), do: a - b
end

IO.puts MyMath.add(2, 3)      # Outputs 5
IO.puts MyMath.subtract(5, 2) # Outputs 3
