defmodule TicTacToe do
  def start do
    board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    play(board, "X")
  end

  def play(board, player) do
    print_board(board)
    updated_board = player_turn(board, player)

    cond do
      check_winner(updated_board, player) ->
        print_board(updated_board)
        IO.puts("🎉 Player #{player} wins!")

      check_draw(updated_board) ->
        print_board(updated_board)
        IO.puts("🤝 It's a draw!")

      true ->
        next_player = if player == "X", do: "O", else: "X"
        play(updated_board, next_player)
    end
  end

  def print_board(board) do
    IO.puts """
    #{Enum.at(board, 0)} | #{Enum.at(board, 1)} | #{Enum.at(board, 2)}
    ---------
    #{Enum.at(board, 3)} | #{Enum.at(board, 4)} | #{Enum.at(board, 5)}
    ---------
    #{Enum.at(board, 6)} | #{Enum.at(board, 7)} | #{Enum.at(board, 8)}
    """
  end

  def player_turn(board, player) do
    input = IO.gets("Player #{player}, choose a position (1–9): ")
    case Integer.parse(String.trim(input)) do
      {position, ""} when position in 1..9 ->
        index = position - 1
        if Enum.at(board, index) in ["X", "O"] do
          IO.puts("🚫 That spot is already taken. Try again.")
          player_turn(board, player)
        else
          List.replace_at(board, index, player)
        end

      _ ->
        IO.puts("❗ Invalid input. Please enter a number from 1 to 9.")
        player_turn(board, player)
    end
  end

  def check_winner(board, player) do
    wins = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # cols
      [0, 4, 8], [2, 4, 6]             # diagonals
    ]

    Enum.any?(wins, fn [a, b, c] ->
      Enum.at(board, a) == player and
      Enum.at(board, b) == player and
      Enum.at(board, c) == player
    end)
  end

  def check_draw(board) do
    Enum.all?(board, fn spot -> spot in ["X", "O"] end)
  end
end

TicTacToe.start()
