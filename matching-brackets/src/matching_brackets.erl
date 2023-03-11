-module(matching_brackets).

-export([is_paired/1]).

-define(LS, $[).
-define(LC, ${).
-define(LP, $().
-define(RS, $]).
-define(RC, $}).
-define(RP, $)).

is_paired(String) -> 
    is_paired(String, []).

is_paired([], []) -> 
    true;
is_paired([], _) -> 
    false;
is_paired([H|T], Stack) when H =:= ?LP; H =:= ?LC; H =:= ?LS  -> 
    is_paired(T, push(H, Stack));
is_paired([H|_], []) when H =:= ?RP; H =:= ?RC; H =:= ?RS  -> 
    false;
is_paired([H|T], Stack) when H =:= ?RP; H =:= ?RC; H =:= ?RS  -> 
    {PoppedValue, NewStack} = pop(Stack),
    case H of
        ?RP when PoppedValue =:= ?LP -> is_paired(T, NewStack);
        ?RC when PoppedValue =:= ?LC -> is_paired(T, NewStack);
        ?RS when PoppedValue =:= ?LS -> is_paired(T, NewStack);
        _ -> false
    end;
is_paired([_|T], Stack) -> 
    is_paired(T, Stack).

push(Value, Stack) ->
    [Value|Stack].

pop([]) -> empty;
pop([Value|Rest]) ->
    {Value, Rest}.
