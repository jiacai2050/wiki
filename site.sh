#!/bin/bash

set -xe

REMOTE=${1:-origin}

rm -rf _book
gitbook build
rm -rf ../wiki-book/*
cp -r _book/* ../wiki-book
cd ../wiki-book
git add . -A
git commit -m "updated at `date`"
git push $REMOTE gh-pages
