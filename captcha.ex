
defmodule Captcha do
    def get_result() do
        
        digits = get_list()
        get_sum(digits, 0)
        
    end
    
    def get_sum([h|[n|t]], acc)  when h == n do   
        IO.puts "found a match" 
        get_sum([n|t], (acc + h))
    end
    def get_sum([h|[n|t]], acc) when h != n  do
        IO.puts "no match found"
        get_sum([n|t], acc )
    end
    def get_sum([h|n], acc) when h == n  do
        IO.puts "got to the base case with match"
        acc + h
    end
    def get_sum([h|_], acc) do
        IO.puts "got to the base case"
        acc
    end
    
    def get_list() do
        c_input = File.read! "day1_input.txt"

            digits = c_input 
            |> String.trim
            |> String.split("", trim: true) 
            |> Enum.take_while(fn(x) -> String.printable?(x) end) 
            |> Enum.map(fn(x) ->String.to_integer(x) end)
            
            [List.last(digits) | digits]
    end
end
