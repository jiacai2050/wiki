#!/bin/bash

set -xe

gitbook build
cp -r _book/* ../wiki-book
cd ../wiki-book
git add . -A
git commit -m "updated at ${date}"
git push origin pages