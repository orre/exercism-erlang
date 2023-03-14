-module(scrabble_score).

-export([score/1]).


score(Word) ->
    score(string:uppercase(Word), 0).
score([], Sum) ->
    Sum;
score([C|T], Sum) when C == $A; C == $E; C == $I; C == $O; C == $U; C == $L; C == $N; C == $R; C == $S; C == $T ->
    score(T, Sum + 1);
score([C|T], Sum) when C == $D; C == $G ->
    score(T, Sum + 2);
score([C|T], Sum) when C == $B; C == $C; C == $M; C == $P ->
    score(T, Sum + 3);
score([C|T], Sum) when C == $F; C == $H; C == $V; C == $W; C == $Y ->
    score(T, Sum + 4);
score([C|T], Sum) when C == $K ->
    score(T, Sum + 5);
score([C|T], Sum) when C == $J; C == $X ->
    score(T, Sum + 8);
score([C|T], Sum) when C == $Q; C == $Z ->
    score(T, Sum + 10).