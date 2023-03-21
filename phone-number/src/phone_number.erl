-module(phone_number).

-export([number/1, areacode/1, pretty_print/1]).

number(String) ->
  Nice = [X || X <- String, X >= $0, X =< $9],
  [H | Rest] = Nice,
  if H == $1, length(Nice) == 11 ->
       Rest;
     H /= $1, length(Nice) == 11 ->
       "0000000000";
     length(Nice) < 10 ->
       "0000000000";
     true ->
       Nice
  end.

areacode(String) ->
  Number = number(String),
  lists:sublist(Number, 3).

pretty_print(String) ->
  Number = number(String),
  AreaCode = string:substr(Number, 1, 3),
  Group2 = string:substr(Number, 4, 3),
  Group3 = string:substr(Number, 7, 4),
  format("(~s) ~s-~s", [AreaCode, Group2, Group3]).

format(Format, List) ->
  lists:flatten(io_lib:format(Format, List)).
