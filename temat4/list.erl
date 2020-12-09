-module(list).
-compile([export_all]).

len(L) ->
    length([X || X <- L]).

amin([H|T])  -> amin(H, T).
amin(Min, [H|T]) ->
    case Min < H of
        true -> amin(Min, T);
        false -> amin(H, T)
    end;
amin(Min, []) -> Min.

amax([H|T]) -> amax(H, T).
amax(Max, [H|T]) ->
    case Max > H of
        true    -> amax(Max, T);
        false   -> amax(H, T)
    end;
amax(Max, [])  -> Max.

tmin_max(L) -> {amin(L), amax(L)}.

lmin_max(L) -> [amin(L), amax(L)].

ldesc(N) -> lists:seq(N,1,-1).


main() ->
        L = [2,1,3,6],
        io:fwrite("Rozmiar listy: ~p\n",[len(L)]),
        io:fwrite("Najmniejszy element: ~p\n",[amin(L)]),
        io:fwrite("Najwiekszy element: ~p\n",[amax(L)]),
        io:fwrite("Najwiekszy i najmniejszy element(krotka): ~p\n",[tmin_max(L)]),
        io:fwrite("Najwiekszy i najmniejszy element(lista): ~p\n",[lmin_max(L)]),
        io:fwrite("Lista malejaca: ~p\n",[ldesc(10)]).



