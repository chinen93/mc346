#!/usr/bin/python3

#
# MASTERMIND
#
# Aluno: Pedro Hideaki Uiechi Chinen RA:175828
#

#
# CODE
#

def createAllGuesses():
    """
    I create all possible guesses used in the master mind game

    :returns: List with all the possible guesses.
    :rtype: List of List
    """

    maxNumber = 7

    guesses = [[a,b,c,d] 
               for a in range (1,maxNumber) 
               for b in range (1,maxNumber) 
               for c in range (1,maxNumber) 
               for d in range (1,maxNumber)]

    return guesses
# createAllGuesses()


def removeWrongGuesses(guesses, lastGuess, good, regular):
    """
    I remove guesses that can't be the real password.

    :param guesses: All the possible guesses.
    :type  guesses: List of List

    :param lastGuess: Last guess that went against the password.
    :type  lastGuess: List

    :param good: Number of goods in the last guess
    :type  good: Int

    :param regular: Number of regulars in the last guess
    :type  regular: Int

    :returns: Remaining guesses
    :rtype: List of List
    """
    newGuesses= [x 
                 for x in guesses
                 if score(x, lastGuess) == (good) ]

    return newGuesses
# removeWrongGuesses()

def score(guess, lastGuess):
    """
    I give a score to guess against the last guess

    :param guess: A guess
    :type  guess: List
    
    :param lastGuess: The last guess played
    :type  lastGuess: List

    :returns: The score for this guess.
    :rtype: Int
    """

    goodGuess = 0
    regularGuess = 0

    for (x, y) in zip(guess, lastGuess):
        if x == y:
            goodGuess+=1
        elif x in lastGuess:
            regularGuess+=1
    
    return (goodGuess)
# score()


def nextGuess(guesses):
    """
    I get the next guess to go against the password

    :param guesses: List all remaining guesses
    :type  guesses: List of List

    :returns: The next guess
    :rtype: List
    """
    
    guess = guesses[0] 
    del(guesses[0])
    return guess
# nextGuess()


def endGame_p(guesses, good):
    """
    I am a predicate that return true or false. 

    If guesses is a empty list I return True and True. 
    If good == 4 I return True and False.
    Otherwise I return False and False

    :param guesses: List of all the Guesses
    :type  guesses: List of List

    :param good: Number of goods in the last guess
    :type  good: Int

    :returns: End of game, Error
    :rtype: Boolean, Boolean
    """
    endGame = False
    error = False

    if good == 4:
        endGame = True
    else:
        if guesses == []:
            endGame = True
            error = True

    return endGame, error
# endGame_p()


if __name__ == '__main__':   

    # Inicialização das variaveis.
    error = False
    guesses = createAllGuesses()
    endGame = False

    # Chute inicial.
    guess = [1,1,2,2]

    # Enquanto não acabou o jogo continua jogando.
    while not endGame:

        # Escreve na saida padrao o chute.
        print(''.join(str(x) for x in guess))

        # Pega resposta.
        resp = input()
        
        # Pega os valores da resposta.
        good = int(resp) // 10
        regular = int(resp) % 10

        # Verifica se acabou o jogo.
        endGame, error = endGame_p(guesses, good)

        # Se nao acabou.
        if not endGame and not error:
        
            # Remove os chutes que não podem ser a senha.
            guesses = removeWrongGuesses(guesses, guess, good, regular)

            # Verifica se ainda sobrou algum chute a ser feito.
            endGame, error = endGame_p(guesses, good)
            
            # Se não acabou o jogo pega novo chute.
            if not endGame:
                guess = nextGuess(guesses)
    # While()

    # Verifica se houve um erro 
    if error:
        print("erro")
    else:
        print("ganhei")
