-module(difference_of_squares).

-export([difference_of_squares/1, square_of_sum/1, sum_of_squares/1]).



difference_of_squares(Number) -> 
    square_of_sum(Number) - sum_of_squares(Number).

square_of_sum(Number) -> 
    Lst = lists:seq(1, Number),
    Sum = sum(Lst),
    square(Sum).

sum_of_squares(Number) -> 
    Lst = lists:seq(1, Number),
    Squared = lists:map(fun(X) -> square(X) end, Lst),
    sum(Squared).

square(Number) -> 
    Number*Number.

sum(List) ->
    sum(List, 0).

sum([], Acc) -> 
    Acc;
sum([H|T], Acc) -> 
    sum(T, Acc+H).
    