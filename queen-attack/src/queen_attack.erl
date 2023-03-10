-module(queen_attack).

-export([can_attack/2]).

can_attack({F1,R1}, {F2, R2}) ->
    F1 == F2 orelse R1 == R2 orelse abs(F1-F2) =:= abs(R1-R2).
