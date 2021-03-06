%%
%% Copyright (c) 2020 fred@dushin.net
%% All rights reserved.
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%
-module(dht_example).

-export([start/0]).

start() ->
    Pin = 21,
    {ok, DHT} = dht:start(Pin, dht11),
    loop(DHT).

loop(DHT) ->
    case dht:measure(DHT) of
        {ok, Measurement} ->
            {Temp, TempFractional, Hum, HumFractional} = Measurement,
            io:format("Temperature: ~p.~pC  Humidity: ~p.~p%~n", [Temp, TempFractional, Hum, HumFractional]);
        Error ->
            io:format("Error taking measurement: ~p~n", [Error])
    end,
    timer:sleep(30000),
    loop(DHT).
