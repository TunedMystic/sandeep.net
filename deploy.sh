#!/usr/bin/env bash

GR='\033[0;32m'  # Green
NC='\033[0m'     # No color

echo -e "$GR Building site $NC"
hugo

echo -e "$GR Committing the build $NC"
git add -A && git commit -m "public"

echo -e "$GR Pushing to gh-pages $NC"
# Ref: https://stackoverflow.com/questions/13756055/git-subtree-subtree-up-to-date-but-cant-push
git push origin `git subtree split --prefix public master`:gh-pages --force

echo -e "$GR Rolling back the commit $NC"
git reset --hard HEAD~1
