-module(powrot_do_liceum).
-compile([export_all]).


 
pole({kwadrat,X,Y}) ->  X*Y;
pole({kolo,X}) -> 3.14*X*X;
pole({trojkat, X, H}) -> (X*H)/2;
pole({trapez, X, Y, H}) -> ((X+Y)*H)/2;
pole({kula, R}) -> 4*3.14*R*R;
pole({szescian, X}) -> 6*X*X;
pole({stozek, R, L}) -> 3.14 * R * (R + L).

obj({kula, R}) -> 4 / 3 * 3.13 * R * R;
obj({szescian, X}) -> X * X * X;
obj({stozek, R, H}) -> (3.14 * R * R * H)/3.

main() ->
    io:format("Pole kuli o promieniu 5: ~w \n", [pole({kula, 5})]),
    io:format("Objetosc kuli o promieniu 5: ~w \n", [obj({kula, 5})]).
