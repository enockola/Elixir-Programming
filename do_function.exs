# Understanding "do"
defmodule Hello do
  def say do
    IO.puts("Hello, world!")
  end
end

Hello.say()

# actual functions
defmodule Greeter do
  def greet(name) do
    "Hello, #{name}!"
  end
end

IO.puts Greeter.greet("Alice")
