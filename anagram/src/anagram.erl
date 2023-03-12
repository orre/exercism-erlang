-module(anagram).

-export([find_anagrams/2]).


find_anagrams(Subject, Candidates) -> 
    LcSubject = string:lowercase(Subject),
    C0 = lists:filter(fun(X) -> string:lowercase(X) =/= LcSubject end, Candidates),
    SortedSubject = lists:sort(LcSubject),
    [ Z || Z <- C0, lists:sort(string:lowercase(Z)) == SortedSubject].