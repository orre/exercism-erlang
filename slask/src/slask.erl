-module(slask).

-compile(export_all).

chunkify(_, []) ->
    [];
chunkify(N, List) ->
    {First, Rest} = lists:split(N, List),
    [First | chunkify(N, Rest)].
