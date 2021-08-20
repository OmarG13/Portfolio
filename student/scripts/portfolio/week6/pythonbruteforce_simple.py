#!/usr/bin/python3

import hashlib
import itertools


wordlist = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()_+{}:;',./?-="
y=''
length=1
wordlistHash=''
passwordHash= "88d4266fd4e6338d13b845fcf289579d209c897823b9217da3e161936f031589"

while wordlistHash != passwordHash:
    for c in itertools.product(wordlist, repeat=length):
        word = y.join(c)
        wordlistHash = hashlib.sha256(word.encode("utf-8")).hexdigest()
        print(f"Trying password: {word}:{wordlistHash}")
        if wordlistHash == passwordHash:
            print(f"Password has been cracked! It was {word}")
            break
    length=length+1