%% predicado media(L,M) que é satisfeito quando M é a média aritmética
%% entre todos os elementos da lista de números L
%% 
%% Exemplos:
%% ?- media([1,2,3,4], M)
%% m = 2.5
media(L, M) :-
    suma(L, S),
    length(L, N),
    M is S / N.

suma([], 0).
suma([X|Y], S) :-
    suma(Y, S1),
    S is X + S1.
