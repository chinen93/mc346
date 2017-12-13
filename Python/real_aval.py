#!/usr/bin/python3
import sys
import time
from subprocess import call
from os.path import isfile

if (len(sys.argv) < 3):
    print("Missing params")
    exit(1)

all = False

if (len(sys.argv) == 4 and sys.argv[3] == "--all"):
    all = True

master = sys.argv[1]
player = sys.argv[2]

if (not isfile(master) or not isfile(player)):
    print("File do not exist")
    exit(1)

allPasswords = []
isPossible = []

for a in range(1,7):
    for b in range(1,7):
        for c in range(1,7):
            for d in range(1,7):
                if (all):
                    allPasswords.append("".join([str(a),str(b),str(c),str(d)]))
                    if a is b or a is c or a is d or b is c or b is d or c is d:
                        isPossible.append(False)
                    else:
                        isPossible.append(True)
                else:
                    if not(a is b or a is c or a is d or b is c or b is d or c is d):
                        allPasswords.append("".join([str(a),str(b),str(c),str(d)]))
                        isPossible.append(True)

numberGuesses = []

start = time.time()

for (guess,possible) in zip(allPasswords, isPossible):
    guesses = 0

    if call([master, player, guess]) == 1:
        print("Error with the execution of guess {0}".format(guess))
        print("Please test it manually")
        exit(1)

    with open("log", 'r') as result:
        for line in result:
            if "resp." in line:
                guesses += 1
            if ("ganhei" in line and not possible):
                print("Said win when the guess {0} is impossible".format(guess))
            if ("erro" in line and possible):
                print("Said error when the guess {0} is possible".format(guess))

    numberGuesses.append(guesses)

end = time.time()

averageGuesses = sum(numberGuesses) / (float(len(numberGuesses)))
diffAverage = [(abs(averageGuesses - x)**2) for x in numberGuesses]
variance = (sum(diffAverage) / float(len(diffAverage)))**0.5
print("The average number of guesses was {0}".format(averageGuesses))
print("The minimum number of guesses was {0}".format(min(numberGuesses)))
print("The maximum number of guesses was {0}".format(max(numberGuesses)))
print("The std deviation of number of guesses was {0}".format(variance))
print("The average time was {0}s".format((end - start) / float(len(numberGuesses))))
