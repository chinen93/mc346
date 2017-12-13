%% Flatten a nested list structure.  Transform a list, possibly
%% holding lists as elements into a `flat' list by replacing each list
%% with its elements (recursively).

%%     Example:
%%     ?- my_flatten([a, [b, [c, d], e]], X).
%%     X = [a, b, c, d, e]


%% flatten(L, R) is resolved when the list L is flattened. The result
%% is returned in R.

flatten([], []).
flatten([X|Xs], Z) :- is_list(X), flatten(X, Y), 
		      flatten(Xs, Ys), append(Y, Ys, Z).
flatten([X|Xs], Z) :- flatten(Xs, Ys), append([X], Ys, Z).
