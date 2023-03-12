-module(armstrong_numbers).

-export([is_armstrong_number/1]).


is_armstrong_number(Number) ->
    L = integer_to_list(Number),    
    S = armstrong_number(L, length(L), 0),
    S =:= Number.

armstrong_number([], _, Sum) ->
    Sum;
armstrong_number([H|T], Len, Sum) ->
    armstrong_number(T, Len, Sum + pow(H-48, Len)).

pow(M, E) ->
    pow(M, E, 1).
pow(_, 0, P) -> 
    P;
pow(M, E, P) ->
    pow(M, E-1, M*P).
