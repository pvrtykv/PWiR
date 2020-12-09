-module(convert_temp).
-compile([export_all]).

c2f(C) -> (C *9/5) + 32.
c2k(C) -> C + 273.15.
c2r(C) -> c2k(C) * 9/5.

f2c(F) -> (F - 32) * 5/9.
f2k(F) -> c2k(f2c(F)).
f2r(F) -> c2r(f2c(F)).

k2c(K) -> K - 273.15.
k2f(K) -> c2f(k2c(K)).
k2r(K) -> c2r(k2c(K)).

r2f(R) -> R - 459.67.
r2c(R) -> f2c(r2f(R)).
r2k(R) -> f2k(r2f(R)).


convert({From, Temp}, To) ->
    case {From, Temp} of 
        {c, Temp} -> 
            case To of 
                f -> c2f(Temp);
                k -> c2k(Temp);
                r -> c2r(Temp)
            end;
        {f, Temp} -> 
            case To of 
                c -> f2c(Temp);
                k -> f2k(Temp);
                r -> f2r(Temp)
            end;
        {k, Temp} ->
            case To of 
                c -> k2c(Temp);
                f -> k2f(Temp);
                r -> k2r(Temp)
            end;
        {r, Temp} ->            
            case To of 
                f -> r2f(Temp);
                k -> r2k(Temp);
                c -> r2c(Temp)
            end
    end.
    
    main() -> 
        io:fwrite("20 Celcjuszy to ~p Kelwinow\n",[convert({c, 20}, k)]).
        
    
