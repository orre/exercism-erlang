-module(atbash_cipher).

-export([decode/1, encode/1]).


decode(Phrase) ->
    [decode_char(C) || C <- Phrase, C /= 32, C /= 8, C /= 9, C /= 10, C /= 13].

encode(Phrase) ->
    LC = string:lowercase(Phrase),
    group([encode_char(C) || C <- LC, C /= 32, C /= 8, C /= 9, C /= 10, C /= 13, C /= 46, C /= 44], 5).

group(Phrase, Size) ->
    group(Phrase, Size, 1, []).

group([H|T], Size, Count, Acc) when Count < Size ->
    group(T, Size, Count + 1, Acc ++ [H]);
group([H], Size, Count, Acc) when Count == Size ->
    group([], Size, 1, Acc ++ [H]);
group([H|T], Size, Count, Acc) when Count == Size ->
    group(T, Size, 1, Acc ++ [H, 32]);
group([], _Size, _Count, Acc) ->
    Acc.


plaintext_alphabeth() -> "abcdefghijklmnopqrstuvwxyz0123456789".

ciphertext_alphabeth() -> "zyxwvutsrqponmlkjihgfedcba0123456789".

decode_char(Char) ->
    Pos = string:str(ciphertext_alphabeth(), [Char]),
    lists:nth(Pos, plaintext_alphabeth()).

encode_char(Char) ->
    Pos = string:str(plaintext_alphabeth(), [Char]),
    lists:nth(Pos, ciphertext_alphabeth()).
    

