-module(perfect_numbers).

-export([classify/1]).


classify(Number) when Number < 0 -> 
    erlang:error("Negative integer is rejected (as it is not a positive integer)");
classify(Number) when Number == 0 -> 
    erlang:error("Zero is rejected (as it is not a positive integer");
classify(Number) -> 
    S = aliquot_sum(Number, 1, 0),
    if 
        Number == S -> perfect;
        S > Number -> abundant;
        true -> deficient
    end.

aliquot_sum(N, K, Sum) when K == N -> 
    Sum;
aliquot_sum(N, K, Sum) when N rem K =:= 0 ->
    aliquot_sum(N, K+1, K+Sum);
aliquot_sum(N, K, Sum) ->
    aliquot_sum(N, K+1, Sum).
