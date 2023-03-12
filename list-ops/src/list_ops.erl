-module(list_ops).

-export([append/2, concat/1, filter/2, length/1, map/2, foldl/3, foldr/3,
	 reverse/1]).

append([H|T], Tail) ->
	[H|append(T, Tail)];
append([], Tail) ->
	Tail.

concat(List) ->
	concat(List, []).
concat([H|T], Acc) ->
	concat(T, append(Acc, H));
concat([], Acc) ->
	Acc.

filter(F, [H|T]) ->
	case F(H) of
		true  -> [H|filter(F, T)];
		false -> filter(F, T)
	end;
filter(_, []) -> 
	[].

length(List) -> 
	foldl(fun(_H, Accu) -> Accu + 1 end, 0, List).

map(F, [H|T]) -> 
	[F(H)|map(F, T)];
map(_, []) -> 
	[].

foldl(F, Acc, [Hd|Tail]) ->
    foldl(F, F(Hd, Acc), Tail);
foldl(_, Acc, []) -> 
	Acc.

foldr(_, Acc, []) -> 
	Acc;
foldr(F, Acc, [H|T]) -> 
	F(H, foldr(F, Acc, T)).

reverse([]) -> 
	[];
reverse([H|T]) -> 
	reverse(T)++[H].

