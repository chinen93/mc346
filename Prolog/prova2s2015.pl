%% 
%% Prova Prolog 2 semestre 2015.
%% 

%% ==============================================================
%% 
%% ==============================================================

%% Questão 1) Escreva um predicado alphanums(N) em Prolog que lê uma
%% linha da entrada padrão e é satisfeito quando N é o número de
%% caracteres alfanumericos que existem nesta linha 

%% Dica: O predicado pré-definido is_alnum(X) é satisfeito quando seu
%% argumento é um caractere alfanumérico

alphanums(N) :- get_char(X),
		trata(X, N).

trata('\n', 0) :- !.

trata(C, N) :- is_alnum(C),
	       !,
	       alphanums(N1),
	       N is N1 + 1.

trata(_, N) :- alphanums(N).


%% ==============================================================
%% 
%% ==============================================================

%% Questão 2) Numa universidade, os pré-requisitos enre disciplinas
%% são guardados numa lista Prolog da forma:
%% 
%% [pre(X1, Y1), pre(X2, Y2), ...]
%% 
%% Inficando que X1 é pré-requisito de Y1, X2 é pré-requisito de Y2, etc. 
%% 
%% Escreva um predicado cadeia(L, C) que recebe uma lista L de
%% pré-requisitos como acima e é satisfeito quando C é uma cadeia de
%% pré-requisitos, isto é, uma lista com pelo menos dois elementos
%% [Z1, Z2, Z3, ..., Zn] onde Zi é pré-requisito de Zi+1 para i de 1 a
%% N-1


%% cadeia([pre(x1, y1), pre(y1, z1), pre(y2, z1)], C).

cadeia([pre(X, Y)|Xs], [X|Ys]) :- cadeiaAux(Xs, Y, Ys).

cadeiaAux([], Z, [Z]).

cadeiaAux([pre(Y,Z)|Xs], Y, [Y|Ys]) :- cadeiaAux(Xs, Z, Ys). 

cadeiaAux([pre(X,Z)|Xs], Y, [Y, X|Ys]) :- cadeiaAux(Xs, Z, Ys). 


%% ==============================================================
%% 
%% ==============================================================

%% Questão 3) Escreva um predicado somapares(N, S) que é satisfeito
%% quando N é um número real e S é a soma de todos os inteiros pares
%% de 0 a N. Por exemplo:
%% 
%% somapares(6, S)
%% S = 12

somapares(0, 0) :- !.

somapares(N, S) :- 1 is N mod 2, 
		   !, 
		   N1 is N - 1,
		   somapares(N1, S).

somapares(N, S) :- N1 is N - 2,
		   somapares(N1, S1),
		   S is S1 + N. 

%% ==============================================================
%% 
%% ==============================================================

%% Questão 4) Num banco, as movimentações financeiras de uma conta
%% para outra são registradas numa lista Prolog da forma:
%% 
%% [mov(D1, P1, T1, V1), mov(D2, P2, T2, V2), ... ]
%% 
%% Onde mov(D, P, T, V) significa que foram transferidos V reais da
%% conta D para a conta P no instante T.
%% 
%% Note que se o valor V fosse zero não precisaria existir a
%% movimentação, e se fosse negativo o mesmo efeito poderia ser obtido
%% invertendo as posições de D e P. Desta forma, para normalizar, o
%% banco adota a convenção que todos os valores V nesta lista são
%% positivos
%% 
%% Escreva um predicado Prolog liq(L, C, T1, T2, S) que é satisfeito
%% quando L é uma lista de movimentações como acima, C é uma conta, T1
%% e T2 são dois momentos no tempo, com T1 < T2, e S é o valor líquido
%% (positivo ou negativo) movimentado na conta C entre os instantes T1
%% e T2, de acordo com a lista L.
%% 
%% Seu predicado deve funcionar no caso em que todos os argumentos são
%% dados, exceto S. Para tanto, você deverá observar todas as
%% movimentações em L entre os instantes T1 e T2 (inclusive), somar
%% aquelas onde o dinheiro entra em C e subtrair aquelas onde o
%% dinheiro sai de C. O resultado será S.
%% 
%% Se T1 > T2 seu predicado só deverá ser satisfeito se S = 0.

%% liq([mov(c1, c2, 1, 10), mov(c2, c1, 3, 7)], c1, 1, 3, S).

liq([], _, _, _, 0) :- !.

liq(_, _, T1, T2, 0) :- T1 > T2, !.

liq([mov(C, _, T, V)|Xs], C, T1, T2, S) :- T1 =< T,
					   T2 >= T,
					   !,
					   liq(Xs, C, T1, T2, S1),
					   S is S1 - V.

liq([mov(_, C, T, V)|Xs], C, T1, T2, S) :- T1 =< T,
					   T2 >= T,
					   !,
					   liq(Xs, C, T1, T2, S1),
					   S is S1 + V.

liq([_|Xs], C, T1, T2, S) :- liq(Xs, C, T1, T2, S).
