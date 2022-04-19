#!/bin/bash

git clone https://github.com/diniyol/why.git
git config --global user.email "whyproject002@gmail.com"
git config --global user.name "diniyol"
rm -rf .git
git init
rm -rf oke
git add .
git commit -m init
git branch -M main
git remote add origin https://github.com/diniyol/why.git
git push -f https://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@github.com/diniyol/why.git

