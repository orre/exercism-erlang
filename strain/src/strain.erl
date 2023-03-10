-module(strain).

-export([keep/2, discard/2]).

keep(Fn, List) ->
  lists:filter(Fn, List).

discard(Fn, List) ->
  lists:filter(fun(X) -> not Fn(X) end, List).
