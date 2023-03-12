-module(secret_handshake).

-export([commands/1]).


commands(Number) -> 
    commands(Number, []).

commands(Number, List) when Number band 8 == 8 ->
    commands(Number bxor 8, ["jump"|List]);
commands(Number, List) when Number band 4 == 4 ->
    commands(Number bxor 4, ["close your eyes"|List]);
commands(Number, List) when Number band 2 == 2 ->
    commands(Number bxor 2, ["double blink"|List]);
commands(Number, List) when Number band 1 == 1 ->
    commands(Number bxor 1, ["wink"|List]);
commands(Number, List) when Number band 16 == 16 ->
    reverse(List);
commands(0, List) ->
    List.

reverse([]) -> [];
reverse([H|T]) -> reverse(T)++[H].
