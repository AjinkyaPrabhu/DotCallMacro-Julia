

mutable struct A
    num :: Int64
end



function add(self::A)
    self.num+=1
    return self
end

a = A(1)
add(a)
add(a)


macro dotcall(exp)
    
    string_rep = repr(exp)
    splited = split(string_rep,".")
    for i in 1:length(splited)
        # print(i," ")
        # splited[i] = replace(splited[i],"("=>"");
        splited[i] = replace(splited[i],")"=>"")
        splited[i] = replace(splited[i],":"=>"")
        # print(splited[i])
    end
    exp_eval = ""

    number_bracket_open = 0
    for i in length(splited):-1:1
       if i==1
            var = replace(splited[i],"("=>"")
            # println(var)
            exp_eval *= var*(")"^number_bracket_open)
       else
            number_bracket_open+=1
            exp_eval*=splited[i]
       end
    end
   print(eval(Meta.parse(exp_eval)))


end


   

    # push!(call_stack)




@dotcall "hellow my".split()

println(a)

