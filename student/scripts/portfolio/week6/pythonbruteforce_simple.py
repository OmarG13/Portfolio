#!/usr/bin/python3

# Bruteforce script to test combinations of characters against a provided hash
# This script is a modified version based on the script found at:
# https://stackoverflow.com/questions/62482430/why-is-my-python-brute-force-hash-cracker-now-working
# as well as Week 6.5 sample script "Cracking password in Python".

import hashlib
import itertools

# Define variables

characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()_+{}:;',./?-="
x=''
length=1
wordlistHash=''
passwordHash= "88d4266fd4e6338d13b845fcf289579d209c897823b9217da3e161936f031589"

# State that while the wordlistHash variable is not equal to passwordHash variable
# go through iterations of the characters variable with a repeat of the length
# variable (which is 1 in this case) thereby creating the variable "word". This 
# is then hashed and becomes the wordlistHash variable which gets checked against
# passwordHash variable.

while wordlistHash != passwordHash:
    for y in itertools.product(characters, repeat=length):
        word = x.join(y)
        wordlistHash = hashlib.sha256(word.encode("utf-8")).hexdigest()
        print(f"Trying password: {word}:{wordlistHash}")

# if the wordlistHash and passwordHash variables are equal, we print a confirmation
# and the loops is broken, otherwise length becomes length+1 to add an additional
# character to the iteration and the loops continues.

        if wordlistHash == passwordHash:
            print(f"Password has been cracked! It was {word}")
            break
    length=length+1