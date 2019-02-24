#!/bin/bash

set -xe

REMOTE=${1:-oschina}

gitbook build
cp -r _book/* ../wiki-book
cd ../wiki-book
git add . -A
git commit -m "updated at `date`"
git push $REMOTE gh-pages
