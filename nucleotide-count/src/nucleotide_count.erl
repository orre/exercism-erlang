-module(nucleotide_count).

-export([count/2, nucleotide_counts/1]).

count(Strand, Nucleotide) ->
    Nucleotides = nucleotide_counts(Strand),
    {value, {_, Count}} = lists:search(fun({Name, _}) -> Name == Nucleotide end, Nucleotides),
    Count.

nucleotide_counts(Strand) ->
    nucleotide_counts(Strand, 0, 0, 0, 0).

nucleotide_counts([], A, C, G, T) ->
    [{"A", A}, {"C", C}, {"G", G}, {"T", T}];
nucleotide_counts([Nucleotide | Rest], A, C, G, T) when Nucleotide == $A ->
    nucleotide_counts(Rest, A + 1, C, G, T);
nucleotide_counts([Nucleotide | Rest], A, C, G, T) when Nucleotide == $C ->
    nucleotide_counts(Rest, A, C + 1, G, T);
nucleotide_counts([Nucleotide | Rest], A, C, G, T) when Nucleotide == $G ->
    nucleotide_counts(Rest, A, C, G + 1, T);
nucleotide_counts([Nucleotide | Rest], A, C, G, T) when Nucleotide == $T ->
    nucleotide_counts(Rest, A, C, G, T + 1).
