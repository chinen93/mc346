%%
%% Prova 1 semestre 2016.
%%

%% =====================================================================
%%
%% =====================================================================

% Questão 1) Escreva um predicado prolog "palavras(N)" que lê uma
% linha da entrada padrão e coloca em N o número de palacras que há
% nesta linha. Uma palavra é um bloco de caracteres consecutivos,
% diferentes de branco e de fim de linha, cercados de ambos os lados
% por branco, começo de linha ou fim de linha

% Exemplos

% ...minha.mae.nao.eh.homem...  
% N = 5

% tudo....pela...vida
% N = 3 

% ....    
% N = 0

palavras(N) :- get_char(X), 
	       trata(X, N).

trata('\n', 0) :- !.

trata(' ', N) :- !, 
		 palavras(N).

trata(_, N) :- fim_palavra(X),
	       trata(X, N1),
	       N is N1 + 1.

fim_palavra(X) :- get_char(C),
		  anda_palavra(C, X).

anda_palavra('\n', '\n') :- !.
anda_palavra(' ', ' ') :- !.
anda_palavra(_, N) :- fim_palavra(N).

%% =====================================================================
%%
%% =====================================================================

% Questão 2) Escreva um predicado "numero(L)" em Prolog que recebe uma
% lista de caracteres e é satisfeito quando a lista contém um número
% binário válido de acordo com a seguinte diagrama sintático, onde
% "digit" só pode ser 0 ou 1.

% exemplos

% numero(['1', '0', '1']).
% true

% numero(['0', '1', '1', '.']).
% true

% numero([’1’, ’1’, ’0’, ’.’, ’1’, ’1’]).
% true

% numero([’1’, ’3’, ’5’, ’.’, ’7’, ’2’, ’e’, ’5’]).  false


digito('1') :- !.
digito('0') :- !.

numero([X]) :- digito(X).
numero([X|L]) :- digito(X), numeroAux(L).

validos('1') :- !. 
validos('0') :- !. 
validos('.') :- !. 

numeroAux([X|L]) :- validos(X), numeroAux(L).
numeroAux([X]) :- validos(X), !.

%% =====================================================================
%%
%% =====================================================================

% Questão 3) Considere a seguinte função:
%
%  f(n) = 3n + 1 se n for impar, n/2 se n for par
%
% Dizem que aplicando f sucessivamente a qualquer inteiro positivo
% chega-se ao número 1. Para ajudar a testar esta afirmação, escreva
% um predicado "passos(N, P)" que é satisfeito quando N é um inteiro
% positivo e P é o número mínimo de vezes que f tem que ser aplicada a
% N para obetermos o número 1.

% Exemplos

% ?- passos(1, P). %note que 1 j ́a  ́e 1
% P = 0

% ?- passos(2, P) %note que 2→1
% P = 1

% ?- passos(3, P). %note que 3→10→5→16→8→4→2→1
% P = 7

funcao(N, R) :- 0 is N mod 2, R is N/2, !.
funcao(N, R) :- R is 3 * N + 1, !.

passos(1, 0) :- !.
passos(N, P) :- N > 1,
		funcao(N, R),
		passos(R, P1),
		P is P1 + 1.
 
%% =====================================================================
%%
%% =====================================================================

% Questão 4) Suponha que uma fã de séries dramáticas tenha construido
% uma lista contendo todas as séries de que gosta, juntamente com o
% ano de início e final de cada série, no formato a seguir:

% [serie(house of cards, 2013, 2016), 
%  serie(law and order, 1990,2010), 
%  serie(breaking bad, 2008, 2013), ...]

% Escreva um predicado "series(L, A, S)" que recebe uma lista como
% esta no parâmetro L e um inteiro representando um ano no parâmetro
% A, retornando em S uma sublista de L contendo apenas os NOMES das
% séries que estavam no ar naquele ano


series([], _, []).
series([serie(Nome, AnoI, AnoF)|Xs], A, [Nome|Ys]) :- series(Xs, A, Ys),
						      AnoI =< A,
						      AnoF >= A,
						      !.
series([_|Xs], A, Ys) :- series(Xs, A, Ys).

%% series([X|Xs], A, [X|Ys]) :- series(Xs, A, Ys).

% series([serie(house_of_cards, 2013, 2016), serie(law_and_order, 1990,2010), serie(breaking_bad, 2008, 2013)], 2000, R).
