-module(hamming).

-export([distance/2]).


distance(Strand1, Strand2) when length(Strand1) =/= length(Strand2) -> 
    {error, badarg};
distance(Strand1, Strand2) ->
    L1 = [ C1 =/= C2 || {C1, C2} <- lists:zip(Strand1, Strand2) ],
    length(lists:filter(fun(X) -> X == true end, L1)).



