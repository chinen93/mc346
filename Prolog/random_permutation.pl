%% Generate a random permutation of the elements of a list.
%%     Example:
%%     ?- rnd_permu([a,b,c,d,e,f],L).
%%     L = [b,a,d,c,e,f]

%% random_permutation(L, R) is satiesfied when R is a permutation of
%% L.

%% [removeKthElement].
%% [random_set].

random_permutation(L, R) :- length(L, X), random_set(L, X, R).

