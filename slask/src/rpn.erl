-module(rpn).

-compile(export_all).

calc(String) ->
    Tokens = string:tokens(String, " "),
    [Res] = lists:foldl(fun calc/2, [], Tokens),
    Res.

calc([], Stack) ->
    Stack;
calc(Elem, Stack) ->
    case parse(Elem) of
        {add} ->
            [S1, S2 | Rest] = Stack,
            [S2 + S1 | Rest];
        {sub} ->
            [S1, S2 | Rest] = Stack,
            [S2 - S1 | Rest];
        {'div'} ->
            [S1, S2 | Rest] = Stack,
            [S2 / S1 | Rest];
        {mul} ->
            [S1, S2 | Rest] = Stack,
            [S2 * S1 | Rest];
        {number, Value} ->
            [Value | Stack]
    end.

parse([Op]) when Op == $+ ->
    {add};
parse([Op]) when Op == $- ->
    {sub};
parse([Op]) when Op == $/ ->
    {'div'};
parse([Op]) when Op == $* ->
    {mul};
parse(Elem) ->
    Number =
        try
            list_to_integer(Elem)
        catch
            error:_ ->
                list_to_float(Elem)
        end,
    {number, Number}.
