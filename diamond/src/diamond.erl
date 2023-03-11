-module(diamond).

-export([rows/1]).


rows([Letter]) ->
    Letters = lists:seq($A, Letter),
    Alpha = Letters ++ lists:nthtail(1, lists:reverse(Letters)),
    Rank = length(Letters),
    Dim = (Rank-1)*2+1,
    Rows = [diamond_row(X) || X <- Alpha],
    PaddedRows = [ pad_row(X, Dim) || X <- Rows],
    PaddedRows.

diamond_row(Letter) ->
    N = Letter - $A,
    if 
        N =:= 0 -> [Letter];
        true -> [Letter] ++ [ 32 || _X <- lists:seq(1, (N-1)*2+1) ] ++ [Letter]
    end.

pad_row(Row, Dim) when length(Row) =:= Dim -> 
    Row;
pad_row(Row, Dim) -> 
    PL = (Dim - length(Row)) div 2,
    pad(PL, 32) ++ Row ++ pad(PL, 32).

pad(N, Char) ->
    [ Char || _X <- lists:seq(1, N) ]. 