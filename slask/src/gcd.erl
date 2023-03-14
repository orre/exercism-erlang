-module(gcd).

-export([dijkstra/2]).

dijkstra(M, N) when M == N ->
    M;
dijkstra(M, N) when M > N ->
    dijkstra(M - N, N);
dijkstra(M, N) ->
    dijkstra(M, N - M).
