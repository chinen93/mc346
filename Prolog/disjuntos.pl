%% Satiesfeito quando LL é uma lista de listas L1, L2, .... , Ln e não
%% há elementos em comum entre Li e Lj, para i e j distintos
%%
%% Exemplos 
%% ?- disjuntos ([[1,0,1], [2,3], [a,b,c]])
%% true
%% ?- disjuntos ([[1,0,c], [2,3], [a,b,c], []])
%% false
disjuntos([]).
disjuntos([X|Y]) :-
    nomeet(X, Y),
    disjuntos(Y).

nomeet(_, []).
nomeet(X, [Y|Z]) :-
    intersection(X, Y, []),
    nomeet(X, Z).
