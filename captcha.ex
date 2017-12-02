
defmodule Captcha do



    def get_result_part_1() do
        
        digits = get_list_part_1()
        get_sum(digits, 0)
        
    end
    
    def get_result_part_2() do
        
        digits = get_digits()
        n = trunc(Enum.count(digits)/2)
        
        digits 
        |> Enum.concat(Enum.slice(digits, 0..n))
        |> get_second_sum(n,0)
        
    end
    
    
    def get_second_sum([h|tail], i, acc) do
        
        if Enum.count(tail) > i do
            next = Enum.fetch!(tail, i-1)
            case {h,next} do
                {h,h} -> get_second_sum(tail, i, (acc+h))
                _ -> get_second_sum(tail, i, acc)
            end        
        else
            acc
        end
    

    end
    
    def get_second_sum([], _, acc) do
        acc
    end
    
    
    def get_sum([h|[n|t]], acc)  when h == n do   
        get_sum([n|t], (acc + h))
    end
    def get_sum([h|[n|t]], acc) when h != n  do
        get_sum([n|t], acc )
    end
    def get_sum([h|n], acc) when h == n  do
        acc + h
    end
    def get_sum([_], acc) do
        acc
    end
    
    def get_list_part_1() do
            digits = get_digits()            
            [List.last(digits) | digits]
    end
    
    def get_digits() do
    
        input = File.read! ("day1_input.txt")
        
        input
        |> String.trim
        |> String.split("", trim: true) 
        |> Enum.take_while(fn(x) -> String.printable?(x) end) 
        |> Enum.map(fn(x) ->String.to_integer(x) end)
    end
end

