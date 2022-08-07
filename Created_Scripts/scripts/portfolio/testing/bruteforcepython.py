#!/usr/bin/python3

import hashlib
import itertools

def bruteforce(passwordHash, hashtype):

    wordlist = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()_+{}:;',./?-="
    y=''
    length=1
    wordlistHash=''
    passwordHash=passwordHash

    while wordlistHash != passwordHash:
        for c in itertools.product(wordlist, repeat=length):
            word = y.join(c)
            if hashtype == 'sha256':
                wordlistHash = hashlib.sha256(word.encode("utf-8")).hexdigest()
                print(f"Trying password: {word}:{wordlistHash}")
                if wordlistHash == passwordHash:
                    print(f"Password has been cracked! It was {word}")
                    break
            elif hashtype == 'md5':
                wordlistHash = hashlib.md5(word.encode("utf-8")).hexdigest()
                print(f"Trying password: {word}:{wordlistHash}")
                if wordlistHash == passwordHash:
                    print(f"Password has been cracked! It was {word}")
                    break
            elif hashtype == 'sha1':
                wordlistHash = hashlib.sha1(word.encode("utf-8")).hexdigest()
                print(f"Trying password: {word}:{wordlistHash}")
                if wordlistHash == passwordHash:
                    print(f"Password has been cracked! It was {word}")
                    break
            else:
                print("Please either enter a sha256, md5 or sha1 hash and restart the script")
                exit()


        length=length + 1

bruteforce('2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824', 'sha256')