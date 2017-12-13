%% 
%% Prova 2 semestre 2014
%% 

%% ======================================================================
%% 
%% ======================================================================

%% Questão 1) Escreva um predicado vogais(N) em Prolog que lê uma
%% linha da entrada padrão e é satisfeito quando N é o número de
%% vogais que existem nesta linha. Conte vogais tanto maiúsculas como
%% minúsculas.

is_vogal('a') :- !.  is_vogal('e') :- !.  is_vogal('i') :- !.
is_vogal('o') :- !.  is_vogal('u') :- !.  is_vogal('A') :- !.
is_vogal('E') :- !.  is_vogal('I') :- !.  is_vogal('O') :- !.
is_vogal('U') :- !.

vogais(N) :- get_char(X),
	     trata(X, N).

trata('\n', 0) :- !.

trata(C, N) :- is_vogal(C),
	       !,
	       vogais(N1),
	       N is N1 + 1.

trata(_, N) :- vogais(N).

    


%% ======================================================================
%% 
%% ======================================================================

%% Questão 2) Suponha que exista um predicado já definido dentro(P)
%% que é satisfeito quando P é uma posição que está dentro de uma
%% certa pista de corrida. Escreva um predicado conta(L, D, F) que
%% recebe uma lista L de posições e é satisfeito quando D e F são
%% respectivamente o número de posições dentro e fora da pista em
%% questão.

%% ======================================================================
%% 
%% ======================================================================

%% Questão 3) Suponha que existe um predicado já definido f(A, B) que
%% é satisfeito quando A é filho ou filha de B. Escreva um predicado
%% consang(C, D) que é satisfeito quando C e D são parentes
%% consanguíneos, ou seja, existe um ancestral comum entre C e D

f(a,b).
f(b,d).
f(a,c).

cosang(A, B) :- f(A, B), !.
cosang(A, B) :- f(B, A), !.
cosang(A, B) :- f(X, B), f(X, A).
cosang(A, B) :- f(X, Y), f()


%% ======================================================================
%% 
%% ======================================================================

%% Questão 4) Escreva u predicado perfeito(N) que é satisfeito quando
%% N é um número inteiro perfeito, isto é, N é igual à soma de todos
%% os seus divisores menores que o próprio N. Por exemplo, 6 é
%% perfeito, pois 6= 1 + 2 + 3; mas 10 não é, pois 10 \= 1 + 2 + 5
