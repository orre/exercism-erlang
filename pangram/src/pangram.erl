-module(pangram).

-export([is_pangram/1]).

is_pangram(Sentence) ->
    Map = maps:from_keys("ABCDEFGHIJKLMNOPQRSTUVWXYZ", 0),
    Counts = count(string:uppercase(Sentence), Map),
    maps:size(maps:filter(fun(_, Value) -> Value == 0 end, Counts)) == 0.

count([], Map) ->
    Map;
count([H|T], Map) ->
    case maps:is_key(H, Map) of
        true ->
            count(T, maps:update_with(H, fun(V) -> V + 1 end, Map));
        _ ->
            count(T, Map)
    end.
