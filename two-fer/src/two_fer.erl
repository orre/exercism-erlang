-module(two_fer).

-export([two_fer/0, two_fer/1]).


two_fer() -> 
  "One for you, one for me.".
two_fer(Name) -> 
  lists:concat(["One for ", Name, ", one for me."]).



