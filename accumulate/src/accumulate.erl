-module(accumulate).
-export([accumulate/2]).

%%
%% given a fun and a list, apply fun to each list item replacing list item with fun's return value.
%%
-spec accumulate(fun((A) -> B), list(A)) -> list(B).
% accumulate(Fn, List) -> lists:map(Fn, List).

accumulate(Fn, List) -> 
  acc(Fn, List, []).

acc(_Fn, [], Acc) -> Acc;
acc(Fn, [H|T], Acc) -> acc(Fn, T, Acc ++ [Fn(H)]).
