#!/usr/local/bin/elixir
defmodule Solution do
  def check(board, symbol, player) do
    for row <- 0..2 do
      x = board |> Enum.at(row)
      if Enum.at(x, 0) === Enum.at(x, 1) and Enum.at(x, 2) === symbol and Enum.at(x, 2) === Enum.at(x, 0) do
        IO.puts player
        read()
      end
    end
    for row <- 0..2 do
      initial = board|>Enum.at(row)|>Enum.at(0)
      IO.puts(initial)
      count = 0
      for colum <- 0..2 do
        value = board|>Enum.at(row)|>Enum.at(colum)
        IO.puts(value)
        if value === initial and value !== " " do
            count = count + 1
            IO.puts(count)
        end
		    IO.puts("-----")
	    end
	    if count == 3 do
        if initial == symbol do
          IO.puts player
          read()
        end
	    end
	  end
  end

  def update_list(board, idx, player) do
		x = idx - 1 |> div 3
		y = idx - 1 |> rem 3
		#foo = List.replace_at(foo,0,List.replace_at(Enum.at(foo,1),0,5))
		board = List.replace_at(board, x, List.replace_at(Enum.at(board, x), y, player))
  end

  def ptp_play(board) do
		endgame = 0
		IO.puts "player 1(X)  waiting......"
		data = IO.read(:stdio, :line) |> String.trim |> String.to_integer
		board = update_list(board, data, "X")
		print_grid(board)
		check(board, "X", "Player 1 Won")
		#board
		#|> Enum.at(data - 1 |> div 3)
		#|> Enum.at(data - 1 |> rem 3)
		#|> IO.puts()
		IO.puts "player 2(O)  waiting......"
		data = IO.read(:stdio, :line) |> String.trim |> String.to_integer
		board = update_list(board, data, "O")
		print_grid(board)
		check(board, "O", "Player 2 Won")
		#board
		#|> Enum.at(data - 1 |> div 3)
		#|> Enum.at(data - 1 |> rem 3)
		#|> IO.puts()
		if endgame === 0 do
			ptp_play(board)
		end
  end

  def print_grid(board) do
    for row <- 0..2 do
      for col <- 0..2 do
        board
        |> Enum.at(row)
        |> Enum.at(col)
      end
      |> Enum.join("  |")
    end
    |> Enum.join("\n---+---+---\n")
    |> IO.puts()
  end

  #Enter your code here. Read input from STDIN. Print output to STDOUT
  def help_tic do
	  IO.puts "Help: "
  end

  def ptp do
    IO.puts "you have choosen player to player mode"
    IO.puts "use numbers 1..9\n"
    board = [["1","2","3"], ["4","5","6"], ["7","8","9"]]
    print_grid(board)
    IO.puts "\nLet's play"
    board = [[" "," "," "], [" "," "," "], [" "," "," "]]
    print_grid(board)
    ptp_play(board)
  end

  def ptb do
    IO.puts "you have choosen player to bot mode "
    IO.puts "use numbers 1..9\n"
    board = [["1","2","3"], ["4","5","6"], ["7","8","9"]]
    print_grid(board)
    IO.puts "\nLet's play"
    board = [[" "," "," "], [" "," "," "], [" "," "," "]]
    print_grid(board)
    ptp_play(board)
  end

  def read do
    IO.puts("Welcome to Tic Tac Toe")
    IO.puts("Please select one option")
    IO.puts("pres 1: player to player")
    IO.puts("pres 2: player to bot")
    IO.puts("pres 3: help")
    case IO.read(:stdio, :line) do
      :eof -> :ok
      {:error, reason} -> IO.puts "Error: #{reason}"
      data ->
      if data === "1\n" do
        ptp()
      end
      if data === "2\n" do
        ptb()
      end
      if data === "3\n" do
        help_tic()
      end
      #IO.write(:stdio, "Hello, World. \n")
      #IO.write(:stdio, data)
      read()
    end
  end
end

Solution.read()
