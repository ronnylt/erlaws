%% Pythagorean Triplets
%% Pythagorean triplets are sets of integers {A,B,C} such that A**2 + B**2 = C**2.

-module(pyth).
-export([pyth/1]).

pyth(N) ->
    [ {A,B,C} ||
        A <- lists:seq(1,N),
        B <- lists:seq(1,N),
        C <- lists:seq(1,N),
        A+B+C =< N,
        A*A+B*B == C*C 
    ].