#!/bin/bash

# Simple script to commit and push into github
# Github must already be set up
# Git init must already have been run
# $1="Item to be added to github"
# $2="Commit description"

git add $1
git commit -m "$2"
git branch -M main
git push -u origin main

exit 0

