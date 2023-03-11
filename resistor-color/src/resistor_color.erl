-module(resistor_color).

-export([colors/0, color_code/1]).

-define(COLORLIST, [{black, 0}, {brown, 1}, {red, 2}, {orange, 3}, {yellow, 4}, {green, 5}, {blue, 6}, {violet, 7}, {grey, 8}, {white, 9}]).

colors() ->
    [Color || {Color, _Number} <- ?COLORLIST].

color_code(Color) ->
    color_code(Color, ?COLORLIST).

color_code(_Color, []) ->
    erlang:error(badarg);
color_code(Color, [{K, V}|T]) ->
    if 
        K =:= Color -> V;
        true -> color_code(Color, T)
    end.