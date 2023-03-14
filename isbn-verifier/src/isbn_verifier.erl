-module(isbn_verifier).

-export([is_valid/1, digitize/1]).


is_valid(Isbn) ->
    case digitize(Isbn) of
        error -> false;
        {ok, Digits} -> checksum_ok(Digits);
        _ -> false
    end.

checksum_ok(Digits) ->
    checksum_ok(Digits, 10, 0).
checksum_ok([], _I, N) ->
    N rem 11 == 0;
checksum_ok([H|T], I, N) ->
    checksum_ok(T, I - 1, H*I + N).

digitize(Isbn) -> 
    digitize(Isbn, []).

digitize([], Acc) when length(Acc) /= 10 -> 
    error;
digitize([], Acc) -> 
    {ok, Acc};
digitize([H|T], Acc) when H == $- -> 
    digitize(T, Acc);
digitize([H|T], Acc) when H >= $0, H =< $9 -> 
    digitize(T, Acc ++ [H - $0]);
digitize([H], Acc) when H == $X -> 
    {ok, Acc ++ [10]};
digitize([H1, _H2|_T], _Acc) when H1 == $X -> 
    error;
digitize(_List, _Acc) -> 
    error.