-module(prime_factors).

-export([factors/1]).


factors(N) -> 
    factors(N, 2, []).

factors(1, _, Factors) -> Factors;
factors(N, K, Factors) when N rem K == 0 ->
    factors(N div K, K, [K|Factors]);
factors(N, K, Factors) ->
    factors(N, K + 1, Factors).
