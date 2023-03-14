-module(grains).

-export([square/1, total/0]).


square(Square) when Square > 64; Square < 1 -> 
    {error, "square must be between 1 and 64"};
square(Square) -> 
    1 bsl (Square-1).

total() -> 
    total(64, 0).

total(0, Acc) -> 
    Acc;
total(N, Acc) ->
    total(N-1, Acc + square(N)).