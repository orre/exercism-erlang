-module(forth).

-export([evaluate/1, expand/1]).

evaluate(Instructions) ->
    LcInstructions = lists:map(fun string:lowercase/1, Instructions),
    Trimmed = lists:map(fun string:trim/1, LcInstructions),
    Tokens = lists:map(fun(S) -> string:tokens(S, " ") end, Trimmed),
    Expanded = expand(Tokens),
    io:format("~p~n", [Expanded]),
    lists:reverse(eval(Expanded)).

expand(List) ->
    expand(List, maps:new()).

expand([[":" | WordDef] | Rest], Storage) ->
    Storage1 = word_def(WordDef, Storage),
    expand(Rest, Storage1);
expand([CodeIn], Storage) ->
    expand_words(CodeIn, Storage).

expand_words(CodeIn, Storage) ->
    expand_words(CodeIn, [], Storage).

expand_words([], CodeOut, _) ->
    CodeOut;
expand_words([H | T], CodeOut, Storage) ->
    case is_word(H) of
        true ->
            expand_words(T, maps:get(H, Storage, H) ++ CodeOut, Storage);
        _ ->
            expand_words(T, H ++ CodeOut, Storage)
    end.

is_word(Candidate) ->
    [Ch || Ch <- Candidate, Ch < $a orelse Ch > $z] == [].

% is_word(_Candidate) ->
%     false.

word_def([WordName | WordDef], Storage) ->
    word_def(WordName, WordDef, [], Storage).

word_def(WordName, [";"], Accu, Storage) ->
    maps:put(WordName, Accu, Storage);
word_def(WordName, [H | T], Accu, Storage) ->
    case is_word(H) of 
        true -> word_def(WordName, T, Accu ++ maps:get(H, Storage, H), Storage);
        _ -> word_def(WordName, T, Accu ++ [H], Storage)
    end.

eval(Code) ->
    eval(Code, []).

eval([], Stack) ->
    Stack;
eval(["+" | Rest], Stack) ->
    [S1, S2 | Tail] = Stack,
    eval(Rest, [S2 + S1 | Tail]);
eval(["-" | Rest], Stack) ->
    [S1, S2 | Tail] = Stack,
    eval(Rest, [S2 - S1 | Tail]);
eval(["*" | Rest], Stack) ->
    [S1, S2 | Tail] = Stack,
    eval(Rest, [S2 * S1 | Tail]);
eval(["/" | Rest], Stack) ->
    [S1, S2 | Tail] = Stack,
    eval(Rest, [S2 div S1 | Tail]);
eval(["dup" | Rest], Stack) ->
    eval(Rest, [hd(Stack) | Stack]);
eval(["drop" | Rest], Stack) ->
    [_ | Tail] = Stack,
    eval(Rest, Tail);
eval(["over" | Rest], Stack) ->
    [S1, S2 | Tail] = Stack,
    eval(Rest, [S2, S1, S2 | Tail]);
eval(["swap" | Rest], Stack) ->
    [S1, S2 | Tail] = Stack,
    eval(Rest, [S2, S1 | Tail]);
eval([Number | Rest], Stack) ->
    eval(Rest, [list_to_integer(Number) | Stack]).
