-module(gigasecond).

-export([from/1]).


from({_Date, _Time} = DateTime) ->
    FromInSec = calendar:datetime_to_gregorian_seconds(DateTime),
    FutureMomentInSecs = FromInSec + 1_000_000_000,
    calendar:gregorian_seconds_to_datetime(FutureMomentInSecs);
from(Date) ->
    from({Date, {0,0,0}}).
