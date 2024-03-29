#!/bin/bash

PREFIX="git@github.com:"
SOURCE="${PREFIX}${1}.git"
TARGET="${PREFIX}${2}.git"
BASENAME=$(basename $1)

TMP_DIRECTORY=$(mktemp -d -t mirror-sync-XXXXXXXXXX)
OLD_DIRECTORY=$PWD

set -e

cd $TMP_DIRECTORY

git clone --mirror "$SOURCE" $BASENAME
cd $BASENAME
git remote add target "$TARGET"

# Sometimes upstream re-tags a buggy release
git push target --all --force
git push target --tags --force

cd $OLD_DIRECTORY
rm -rf $TMP_DIRECTORY
