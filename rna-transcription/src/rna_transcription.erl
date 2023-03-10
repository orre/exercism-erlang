-module(rna_transcription).

-export([to_rna/1]).


to_rna(Strand) -> 
  [transcribe(X) || X <- Strand].

transcribe($G) -> $C;
transcribe($C) -> $G;
transcribe($T) -> $A;
transcribe($A) -> $U;
transcribe(_) -> erlang:error(badarg).




