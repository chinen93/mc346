%% Extract a given number of randomly selected elements from a list.
%%     The selected items shall be put into a result list.
%%     Example:
%%     ?- rnd_select([a,b,c,d,e,f,g,h],3,L).
%%     L = [e,d,a]

%%     Hint: Use the built-in random number generator random/2

%% random_set(L, N, R) is satiesfied when the list R has N elements
%% from the list L.

%% [removeKthElement].


random_set(_,0,[]).
%% random_set([], _, _) :- !, false.
random_set(L, N, [X|R]) :- N > 0,
			   length(L, Ls),
			   I is random(Ls) + 1,
			   remove_at(X, L, I, Y),
			   N1 is N-1,
			   random_set(Y, N1, R).
		       
		       
