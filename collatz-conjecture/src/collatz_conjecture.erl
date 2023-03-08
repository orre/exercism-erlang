-module(collatz_conjecture).

-export([steps/1]).


steps(N) when N =< 0 -> erlang:error(badarg);
steps(N) -> steps2(N, 0).

steps2(1, K) -> K;
steps2(N, K) when N rem 2 == 0  -> steps2(N div 2, K+1);
steps2(N, K) -> steps2(N*3 + 1, K+1).
