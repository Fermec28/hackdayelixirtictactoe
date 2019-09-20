#!/usr/local/bin/elixir
IO.puts("Welcome to Tic Tac Toe")
IO.puts("Please select one option")
IO.puts("pres 1: player to player")
IO.puts("pres 2: player to bot")
IO.puts("pres 3: help")
defmodule Solution do
    def print_grid do
		board
        	for row <- 1..3 do
      			for col <- 1..3 do
        			" " <> board[{col, row}]
      			end
      			|> Enum.join(" |")
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
	print_grid()
    end
    def ptb do
	IO.puts "you have choosen player to bot mode "
	print_grid()
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
