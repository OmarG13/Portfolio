#!/bin/bash

# Simple script to commit and push into github
# Github must already be set up
# Git init must already have been run
# $1="Folder to be added to github"
# $2="Commit description"

read -p "Folder to be added to Github:" directory
git add "$directory"
read -p "Commit description:" description
git commit -m "$description"
git branch -M main
git push -u origin main

exit 0

