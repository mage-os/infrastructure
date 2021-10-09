#!/bin/bash

PREFIX="git@github.com:"
SOURCE="${PREFIX}${1}.git"
TARGET="${PREFIX}${2}.git"
BASENAME=$(basename $1)

TMP_DIRECTORY=$(mktemp -d -t mirror-sync-XXXXXXXXXX)
OLD_DIRECTORY=$PWD

cd $TMP_DIRECTORY

git clone --mirror "$SOURCE" $BASENAME
cd $BASENAME
git remote add target "$TARGET"
git push target --all
git push target --tags
cd $OLD_DIRECTORY
rm -rf $TMP_DIRECTORY
