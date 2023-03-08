-module(raindrops).

-export([convert/1]).


convert(Number) ->
  case Number of
    N when N rem 7 == 0, N rem 5 == 0, N rem 3 == 0 -> "PlingPlangPlong";
    N when N rem 5 == 0, N rem 3 == 0 -> "PlingPlang";
    N when N rem 7 == 0, N rem 3 == 0 -> "PlingPlong";
    N when N rem 7 == 0, N rem 5 == 0 -> "PlangPlong";
    N when N rem 3 == 0 -> "Pling";
    N when N rem 5 == 0 -> "Plang";
    N when N rem 7 == 0 -> "Plong";
    _ -> integer_to_list(Number)
  end.



