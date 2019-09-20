#!/usr/local/bin/elixir
IO.puts("Welcome to Tic Tac Toe")
IO.puts("Please select one option")
IO.puts("pres 1: player to player")
IO.puts("pres 2: player to bot")
IO.puts("pres 3: help")
defmodule Solution do
    def ptp_play(board) do
		IO.puts "player 1(X)  waiting......"
		data = IO.read(:stdio, :line) |> String.trim |> String.to_integer
		board	
		|> Enum.at(data - 1 |> div 3)		
		|> Enum.at(data - 1 |> rem 3)
		|> IO.puts()
		IO.puts "player 2(O)  waiting......"
		data = IO.read(:stdio, :line) |> String.trim |> String.to_integer
		board
		|> Enum.at(data - 1 |> div 3)		
		|> Enum.at(data - 1 |> rem 3)
		|> IO.puts()
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
	#board = [[" "," "," h"], [" "," "," "], [" "," "," "]] 
	print_grid(board)
    end
    def ptb do
	IO.puts "you have choosen player to bot mode "
	IO.puts "use numbers 1..9\n"
	board = [["1","2","3"], ["4","5","6"], ["7","8","9"]] 
	print_grid(board)
	IO.puts "\nLet's play"
	#board = [[" "," "," "], [" "," "," "], [" "," "," "]] 
	print_grid(board)
    end
    def read do
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
