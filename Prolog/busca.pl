%% Podemos representar árvores binárias em Prolog com termos da forma
%% arv(L, X, R), onde L é a sub-árvore esquerda, X é o conteúdo da
%% raiz, e R é a sub-árvore direita.  Para esta questão, vamos supor
%% que o conteúdo de cada nó é um número.  Além disso, o átomo nil
%% também é uma árvore válida, representando a árvore vazia.

%% Escreva um predicado busca(A) que é satisfeito quando A é uma
%% estrutura respresentando uma árvore binária de busca. Para esta
%% questão, uma árvore de busca não tem nós com conteúdo repetido, e
%% tem a propriedade de que, em cada nó o conteúdo deste nó é maior
%% que todos os conteúdos na sub-árvore esquerda, e nemos que todos os
%% conteúdos na sub-árvore direita. A árvore vazia é considerada um
%% exemplo válido de árvore de busca

%% Exemplos:
%% ?- busca(arv(arv(arv(nil,4,nil),8,nil),16)).
%% false
%% ?- busca(arv(arv(arv(nil,4,nil),8,nil),16,nil)).
%% true

busca(A) :-
    inorder(A, I),
    increasing(I).

inorder(nil, []).
inorder(arv(L, X, R), I) :-
    inorder(L, IL),
    inorder(R, IR),
    append(IL, [X|IR], I).

increasing([]).
increasing([_]).
increasing([X, Y|Z]) :-
    X < Y,
    increasing([Y|Z]).
