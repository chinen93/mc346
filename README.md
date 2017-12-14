# MC346 - Paradigmas de Programação 2s2017 (Paradinhas)

- Professor: [Joao Meidanis](https://www.ic.unicamp.br/~meidanis/)
- Site matéria: https://www.ic.unicamp.br/~meidanis/courses/mc346/2017s2/

# Desafio de Programação

[Master Mind](https://en.wikipedia.org/wiki/Mastermind_(board_game)). O desafio dessa matéria é desenvolver um algoritmo que possa resolver o jogo Master Mind em 3 diferentes versões: `Prolog`, `Haskell` e `Python`.

Uma pequena explicação de como o jogo funciona: Temos 2 jogadores um `Mestre` e um `Jogador`. O `Mestre` escolhe uma senha de X dígitos podendo ou não ser repetidos. O trabalho do `Jogador` é descobrir qual a senha escolhida pelo `Mestre`. Para tal o `Jogador` diz um chute com X dígitos, o `Mestre` por sua vez diz quantos números são **bons** e **regulares**. 

- Números de **bons** é a quantidade de acertos do chute com relação a senha.
- Números de **regulares** é a quantidade de quase acertos, ou seja, tem o número na senha, mas ele não está na posição correta.

Exemplo: 

- Senha: `1425`
- Chute: `1523` retorna o conjunto de **bons** e **regulares** `2,1`

Cada uma dessas versões é avaliada com relação ao desempenho dos outros alunos, ou seja, tivemos que implementar algo eficiente. Com esse critério utilizei o algoritmo das [cinco tentativas (five-guess)](https://en.wikipedia.org/wiki/Mastermind_(board_game)#Five-guess_algorithm).

O algoritmo consiste em:
01. Criar um conjunto `S` com todas as possibilidades.
02. Iniciar com um chute `C` de `1122`.
03. Verifica `C` com a senha
04. Se a resposta for 4 acertos o jogo termina.
05. Se não, remove do conjunto `S` todas os chutes que não dariam a mesma resposta se `C` fosse a senha.
06. Escolha uma outra senha `C` dos valores restantes de `S`.
07. Volte para o passo 3.
