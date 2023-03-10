-module(space_age).

-export([age/2]).

-define(SECONDS_IN_EARTH_YEAR, 31557600).

age(Planet, Seconds) -> 
    case Planet of 
        mercury -> Seconds / ?SECONDS_IN_EARTH_YEAR/0.2408467;
        venus -> Seconds / ?SECONDS_IN_EARTH_YEAR/0.61519726;
        earth -> Seconds / ?SECONDS_IN_EARTH_YEAR;
        mars -> Seconds / ?SECONDS_IN_EARTH_YEAR/1.8808158;
        jupiter -> Seconds / ?SECONDS_IN_EARTH_YEAR/11.862615;
        saturn -> Seconds / ?SECONDS_IN_EARTH_YEAR/29.447498;
        uranus -> Seconds / ?SECONDS_IN_EARTH_YEAR/84.016846;
        neptune -> Seconds / ?SECONDS_IN_EARTH_YEAR/164.79132;
        _ -> erlang:error(badarg)
    end.