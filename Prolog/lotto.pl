%% Lotto: Draw N different random numbers from the set 1..M.
%% The selected numbersshall be put into a result list.
%% Example:
%% ?- rnd_select(6, 49, L).
%% L = [23, 1, 17, 33, 21, 37]


%% lotto(N, M, L) é satisfeito quando a lista L contém N elementos de
%% valor máximo M


lotto(0, _, []).
lotto(N, M, L) :- 
