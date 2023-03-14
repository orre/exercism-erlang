-module(run_length_encoding).

-export([decode/1, encode/1]).


decode(String) -> 
    decode(String, []).
decode([], Acc) ->
    Acc;
decode([H|T], Acc) when H =< $Z, H >= $A; H =< $z, H >= $a; H == 32 ->
    decode(T, Acc ++ [H]);
decode(String, Acc) ->
    {Len, Char, Rest} = decode_lv(String),
    decode(Rest, Acc ++ lists:duplicate(Len, Char)).

decode_lv(String) ->
    decode_lv(String, []).
decode_lv([H1, H2|T], Acc) when H1 =< $9, H1 >= $0, H2 =< $9, H2 >= $0 ->
    decode_lv([H2|T], Acc ++ [H1]);
decode_lv([H1, H2|T], Acc) when H1 =< $9, H1 >= $0, H2 =< $Z, H2 >= $A; H2 =< $z, H2 >= $a; H2 == 32 ->
    {list_to_integer(Acc ++ [H1]), H2, T}.

encode(String) ->
    encode(String, 0, []).

encode([H1,H2|T], K, Acc) when H1 == H2 ->
    encode([H2|T], K + 1, Acc);
encode([H1|T], K, Acc) when K == 0 ->
    encode(T, 0, Acc ++ [H1]);
encode([H1|T], K, Acc) ->
    encode(T, 0, Acc ++ integer_to_list(K + 1) ++ [H1]);
encode([], _K, Acc) ->
    Acc.
    