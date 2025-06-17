defmodule Calculator do
  def start do
    IO.puts("Welcome to the Elixir Calculator!")
    loop()
  end

  defp loop do
    print_menu()

    choice = IO.gets("Enter choice (1-5): ") |> String.trim()
    operation = convert_choice(choice)

    if operation == :invalid do
      IO.puts("Invalid choice. Try again.")
      loop()
    else
      args = get_arguments(operation)
      result = run(args)
      IO.inspect(result)

      continue? = IO.gets("Do you want to calculate again? (yes/no): ") |> String.trim()
      if String.downcase(continue?) in ["yes", "y"], do: loop(), else: IO.puts("Thanks for using my Calculator!")
    end
  end

  defp print_menu do
    IO.puts("\nChoose an operation:")
    IO.puts("1) Add")
    IO.puts("2) Subtract")
    IO.puts("3) Multiply")
    IO.puts("4) Divide")
    IO.puts("5) Solve quadratic (ax² + bx + c = 0)")
  end

  defp convert_choice("1"), do: :add
  defp convert_choice("2"), do: :subtract
  defp convert_choice("3"), do: :multiply
  defp convert_choice("4"), do: :divide
  defp convert_choice("5"), do: :solve
  defp convert_choice(_), do: :invalid

  defp get_arguments(:solve) do
    a = prompt("Enter a: ")
    b = prompt("Enter b: ")
    c = prompt("Enter c: ")
    %{operation: :solve, a: a, b: b, c: c}
  end

  defp get_arguments(op) when op in [:add, :subtract, :multiply, :divide] do
    a = prompt("Enter first number: ")
    b = prompt("Enter second number: ")
    %{operation: op, a: a, b: b}
  end

  defp get_arguments(_), do: %{}

  defp prompt(message) do
    message
    |> IO.gets()
    |> String.trim()
    |> parse_number()
  end

  defp parse_number(str) do
    case Float.parse(str) do
      {num, ""} -> num
      _ -> raise ArgumentError, "Please enter a valid number."
    end
  end

  # Operation logic
  def run(%{operation: :add, a: a, b: b}), do: a + b
  def run(%{operation: :subtract, a: a, b: b}), do: a - b
  def run(%{operation: :multiply, a: a, b: b}), do: a * b
  def run(%{operation: :divide, a: _a, b: 0}), do: {:error, "Cannot divide by zero"}
  def run(%{operation: :divide, a: a, b: b}), do: a / b

  def run(%{operation: :solve, a: a, b: b, c: c}) do
    d = b * b - 4 * a * c
    case d do
      d when d < 0 -> {:error, "No real roots"}
      _ ->
        {
          :ok,
          {
            (-b + :math.sqrt(d)) / (2 * a),
            (-b - :math.sqrt(d)) / (2 * a)
          }
        }
    end
  end

  def run(_), do: {:error, "Invalid input"}
end

# Run it!
Calculator.start()

# Run program in intergated terminal using "elixir calculator.exs"
