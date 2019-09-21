#!/usr/local/bin/elixir
defmodule Solution do
    def diagonal2(board) do
    	board |> Enum.reverse
	      |> Enum.with_index
	      |> Enum.map(fn({row, index}) -> Enum.at(row, index) end)
    end
    def diagonal(board) do
	for {row, idx} <- Enum.with_index(board),
   		{col, ^idx} <- Enum.with_index(row), do: col
    end
    def transpose(rows) do
	  rows
	  |> List.zip
	  |> Enum.map(&Tuple.to_list/1)
	end
    def check(board, symbol, player) do
	for row <- 0..2 do
		x = board |> Enum.at(row)
		if Enum.at(x, 0) === Enum.at(x, 1) and Enum.at(x, 2) === symbol and Enum.at(x, 2) === Enum.at(x, 0) do
			IO.puts player
			read()
		end
	end
	diag = board |> diagonal()
	if Enum.at(diag, 0) === Enum.at(diag, 1) and Enum.at(diag, 2) === symbol and Enum.at(diag, 2) === Enum.at(diag, 0) do
		IO.puts player
		read()
        end
	t_board = board |> transpose()
	for row <- 0..2 do
		x = t_board |> Enum.at(row)
		if Enum.at(x, 0) === Enum.at(x, 1) and Enum.at(x, 2) === symbol and Enum.at(x, 2) === Enum.at(x, 0) do
			IO.puts player
			read()
		end
	end
	diag2 = board |> diagonal2()
	if Enum.at(diag2, 0) === Enum.at(diag2, 1) and Enum.at(diag2, 2) === symbol and Enum.at(diag2, 2) === Enum.at(diag2, 0) do
		IO.puts player
		read()
        end


    end
    def update_list(board, idx, player) do
		x = idx - 1 |> div 3
		y = idx - 1 |> rem 3
		#foo = List.replace_at(foo,0,List.replace_at(Enum.at(foo,1),0,5))
		board = List.replace_at(board, x, List.replace_at(Enum.at(board, x), y, player))
    end

    def get_at_index(board, idx) do
		x = idx - 1 |> div 3
		y = idx - 1 |> rem 3
		#foo = List.replace_at(foo,0,List.replace_at(Enum.at(foo,1),0,5))
		board |> Enum.at(x) |> Enum.at(y)
    end
    def ptb_play(board, counter, turn) do
		if turn === 1 do
			IO.puts "player 1(X)  waiting......"
			data = IO.read(:stdio, :line) |> String.trim |> String.to_integer
			if data > 9 or data < 0 do 
				IO.puts "Invalid position"
				ptb_play(board, counter, 1)
			end
			sym = get_at_index(board, data)
			if sym !== " " do
				IO.puts "Invalid position"
				ptb_play(board, counter, 1)
			end
			board = update_list(board, data, "X")
			counter = counter + 1
			print_grid(board) 
			check(board, "X", "Player 1 Won")
			if counter < 10 do
				ptb_play(board, counter, 2)
			end
		end
		#board	
		#|> Enum.at(data - 1 |> div 3)		
		#|> Enum.at(data - 1 |> rem 3)
		#|> IO.puts()
		if turn === 2 do
			IO.puts "player 2(O)  waiting......"
			data = :rand.uniform(9)
			sym = get_at_index(board, data)
			if sym !== " " do
				ptb_play(board, counter, 2)
			end
			board = update_list(board, data, "O")
			counter = counter + 1
			print_grid(board) 
			check(board, "O", "Tic Tac Toe  Won")
			if counter < 10 do
				ptb_play(board, counter, 1)
			end
		end
		#board
		#|> Enum.at(data - 1 |> div 3)		
		#|> Enum.at(data - 1 |> rem 3)
		#|> IO.puts()
    end
    def ptp_play(board, counter, turn) do
		if turn === 1 do
			IO.puts "player 1(X)  waiting......"
			data = IO.read(:stdio, :line) |> String.trim |> String.to_integer
			if data > 9 or data < 0 do
				IO.puts "Invalid position"
				ptp_play(board, counter, 1)
			end
			sym = get_at_index(board, data)
			if sym !== " " do
				IO.puts "Invalid position"
				ptp_play(board, counter, 1)
			end
			board = update_list(board, data, "X")
			print_grid(board)
			check(board, "X", "Player 1 Won")
			counter = counter + 1
			if counter < 9 do
				ptp_play(board, counter, 2)
			end
		end
		#board
		#|> Enum.at(data - 1 |> div 3)
		#|> Enum.at(data - 1 |> rem 3)
		#|> IO.puts()
		if turn === 2 do
			IO.puts "player 2(O)  waiting......"
			data = IO.read(:stdio, :line) |> String.trim |> String.to_integer
			if data > 9 or data < 0 do
				IO.puts "Invalid position"
				ptp_play(board, counter, 1)
			end
			sym = get_at_index(board, data)
			if sym !== " " do
				IO.puts "Invalid position"
				ptp_play(board, counter, 2)
			end
			board = update_list(board, data, "O")
			print_grid(board)
			check(board, "O", "Player 2 Won")
			counter = counter + 1
			if counter < 10 do
				ptp_play(board, counter, 1)
			end
		end
		#board
		#|> Enum.at(data - 1 |> div 3)
		#|> Enum.at(data - 1 |> rem 3)
		#|> IO.puts()
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
	  IO.puts "\n\nTic Tac Toe HELP"
    IO.puts "The grid is represented as follows:"
    IO.puts "1  |2  |3\n---+---+---\n4  |5  |6\n---+---+---\n7  |8  |9"
    IO.puts "To make any move you have to use numbers from 1 to 9 mapping the position desired to mark."
    IO.puts "Player #1 will use the 'X' mark by default, Player #2 will use the 'O' mark."
    IO.puts "In case of tie, Player #1 win, sad but true!\n\n"
  end
    def ptp do
	IO.puts "you have choosen player to player mode"
	IO.puts "use numbers 1..9\n"
	board = [["1","2","3"], ["4","5","6"], ["7","8","9"]]
	print_grid(board)
	IO.puts "\nLet's play"
	board = [[" "," "," "], [" "," "," "], [" "," "," "]]
	print_grid(board)
	ptp_play(board, 0, 1)
    end
    def ptb do
	IO.puts "you have choosen player to bot mode "
	IO.puts "use numbers 1..9\n"
	board = [["1","2","3"], ["4","5","6"], ["7","8","9"]]
	print_grid(board)
	IO.puts "\nLet's play"
	board = [[" "," "," "], [" "," "," "], [" "," "," "]]
	print_grid(board)
	ptb_play(board, 0, 1)
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
