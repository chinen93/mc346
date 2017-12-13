%% el(X, L, R) is satiesfied when the element X is present in the list L. The rest of the list is returned in R.

el(X, [X|L], L).
el(X, [_|L], R) :- el(X, L, R).
