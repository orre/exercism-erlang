-module(isogram).

-export([is_isogram/1]).


is_isogram(Phrase) -> 
    LcPhrase = string:lowercase(Phrase),
    Sorted = lists:sort(LcPhrase),
    scan(Sorted).

scan([]) -> true;
scan([_]) -> true;
scan([A,B|T]) when A =:= 32; A =:= $- -> scan([B|T]);
scan([A,B|_]) when A =:= B -> false;
scan([_|T]) -> scan(T).

