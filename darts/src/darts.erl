-module(darts).

-export([score/2]).

score(X, Y) ->
    D = math:sqrt(math:pow(X, 2) + math:pow(Y, 2)),
    if
        D =< 1.0 -> 10;
        D =< 5.0 -> 5;
        D =< 10.0 -> 1;
        true -> 0
    end.
