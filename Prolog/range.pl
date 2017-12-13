%% Create a list containing all integers within a given range.
%%     Example:
%%     ?- range(4,9,L).
%%     L = [4,5,6,7,8,9]

%% range(I, F, L) é satisfeito quando a lista L contem todos os inteiros entre I e F inclusive. A lista criada é retornada em L.

range(F, F, [F]).
range(I, F, [I|Ls]) :- I < F, I1 is I + 1, range(I1, F, Ls).

