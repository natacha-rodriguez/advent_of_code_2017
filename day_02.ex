defmodule Day_02 do
    
    def part_1() do
        
        get_lines()
        |> Enum.map(fn(line) -> get_diff(line) end) 
        |> Enum.sum
        
    end
    
    def part_2() do
        get_lines()
        |> Enum.map(fn(line) ->get_even_div(line) end)
        |> Enum.sum
    end
    
    
    def get_lines() do
        input = File.read! ("day2_input.txt")
        input |> String.split("\n", trim: true) 
        |> Enum.map(fn(line) -> String.split(line, "\t") |> Enum.map(fn(cell) -> String.to_integer(cell) end) end)
    end
    
    
    def get_diff(line) do
        Enum.max(line) - Enum.min(line)
    end
    
    def get_even_div(line) do
        [eve_div] = for i <- line, j <- line, i != j, trunc(i/j) == (i/j) do
            trunc(i/j)
        end
        eve_div
    end
    
end
