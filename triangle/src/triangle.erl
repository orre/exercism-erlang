-module(triangle).

-export([kind/3]).


kind(A, B, C) when A =< 0; B =< 0; C =< 0 -> 
    {error, "all side lengths must be positive"};
kind(A, B, C) when A + B >= C, A + C >= B, C + B >= A ->
    if 
        A == B, B == C -> equilateral;
        A == B; B == C; C == A -> isosceles;
        true -> scalene
    end;
kind(_, _, _) ->
    {error, "side lengths violate triangle inequality"}.

