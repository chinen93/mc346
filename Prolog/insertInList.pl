%% Insert an element at a given position into a list.
%%     Example:
%%     ?- insert_at(alfa,[a,b,c,d],2,L).
%%     L = [a,alfa,b,c,d]

%%  insert_at(X, L, N, R) é satisfeito quando o elemento X é inserido na lista L na posição N. O resultado dessa operação é retornado em R.

insert_at(X, L, 1, [X|L]).
insert_at(X, [Y|Xs], N, [Y|Ys]) :- N > 1, N1 is N - 1, insert_at(X, Xs, N1, Ys).
