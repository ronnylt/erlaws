%% Quicksort implementation

-module(quicksort).
-export([sort/1]).

sort([]) -> [];

sort([Pivot|T]) ->
    sort([ X || X <- T, X < Pivot]) ++
    [Pivot] ++
    sort([ X || X <- T, X >= Pivot]).

