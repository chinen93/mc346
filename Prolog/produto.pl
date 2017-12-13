%% Predicado produto(P) que é satistfeito quando P é o produto de
%% todos os números lidos na entrada padrão, até chegar um número
%% igual a zero, que não será incluido no produto

%% Exemplo:
%% ?- produto(P).
%% |:  4.
%% |:  5.
%% |:  10.
%% |:  0.
%% P = 200

produto(P) :-
    read(N),
    trata(N, P).

trata(0, 1).  trata(N, P) :- N =\= 0, produto(P1), P is N * P1.
