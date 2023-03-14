-module(sum_of_multiples).

-export([sum/2, multiples/2]).


sum(Factors, Limit) -> 
    sum(Factors, Limit, []).
sum([], _Limit, Multiples) ->
    lists:sum(lists:usort(Multiples));
sum([H|T], Limit, Multiples) ->
    sum(T, Limit, Multiples ++ multiples(H, Limit)).

multiples(0, _Limit) ->
    [0];
multiples(N, Limit) ->
    multiples(N, N, Limit).
multiples(N, S, Limit) when S < Limit ->
    [S|multiples(N, S+N, Limit)];
multiples(_N, _S, _Limit) ->
    [].
