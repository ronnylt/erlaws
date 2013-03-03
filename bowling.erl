 -module(bowling).
 -export([test/0,score/1]).
 -import(lists,[duplicate/2]).

 test() ->
 0 = score(duplicate(10,{0,0})),
 60 = score(duplicate(10,{3,3})),
 21 = score([{4,6},{3,5}|duplicate(8,{0,0})]),
 23 = score([{4,6},{5,3}|duplicate(8,{0,0})]),
 26 = score([{10,pass},{5,3}|duplicate(8,{0,0})]),
 15 = score(duplicate(9,{0,0}) ++ [{4,6},{5,nothrow}]),
 18 = score(duplicate(9,{0,0}) ++ [{10,pass},{5,3}]),
 ok.

 score(Frame) ->
   score(Frame,1,0).

 score([{10,_}|T], 10, Total) ->
   Total + 10 + element(1,hd(T)) + element(2,hd(T));

 score([{First,Second}|T], Turn, Total) when First==10 ->
   score(T, Turn+1, Total+10+element(1,hd(T))+element(2,hd(T)));

 score([{First,Second}|T], Turn, Total) when First+Second==10, Turn==10 ->
   Total + 10 + element(1,hd(T));

 score([{First,Second}|T], Turn, Total) when First+Second==10 ->
   score(T, Turn+1, Total+10+element(1,hd(T)));

 score([{First,Second}|T], Turn, Total) ->
   score(T, Turn+1, Total+First+Second);

 score([], _Turn, Total) ->
   Total.