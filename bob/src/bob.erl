-module(bob).

-export([response/1]).

response(String) ->
  IsQuestion = question(String),
  IsYell = yell(String),
  IsSilence = silence(String),
  if IsSilence -> "Fine. Be that way!";
     IsQuestion, IsYell -> "Calm down, I know what I'm doing!";
     IsYell -> "Whoa, chill out!";
     IsQuestion -> "Sure.";
     true -> "Whatever."
  end.

yell(String) -> 
  Uc = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
  Lc = "abcdefghijklmnopqrstuvwxyz",
  NoLc = length(lists:filter(fun(X) -> lists:member(X, Lc) end, String)) == 0,
  AtLeastOneUc = length(lists:filter(fun(X) -> lists:member(X, Uc) end, String)) > 0,
  NoLc and AtLeastOneUc.

question(String) -> 
  case silence(String) of
    true -> false;
    false -> lists:last(string:trim(String)) =:= $?
  end.

silence(String) ->
  length(string:trim(String)) == 0.
