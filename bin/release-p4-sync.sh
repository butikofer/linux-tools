#!/bin/bash

# Config
PERFORCE_ROOT=/home/httpd/dev/perforce

GIT_DIR=${PWD}
REPO_NAME=${PWD##*/}

if [ "$1" == "" ];
then
  echo "Please pick a branch:"
  echo ""
  ls -1 $PERFORCE_ROOT/$REPO_NAME/branches
  echo ""
  echo "USAGE: $0 <RELEASE BRANCH NAME>"
  exit 1
fi

BRANCH_NAME=$1
PERFORCE_DIR=$PERFORCE_ROOT/$REPO_NAME/branches/$BRANCH_NAME

echo "Syncing $GIT_DIR to $PERFORCE_DIR!"

cd $PERFORCE_DIR
p4 revert ...
p4 sync //depot/$REPO_NAME/...  # Make sure we are up-to-date from P4
p4 delete ...  # Recursive delete
p4 submit

cd $GIT_DIR
cp -ar * $PERFORCE_DIR/
cd $PERFORCE_DIR
rm -rf .git  # Remove git repo artifacts
find . -type f -print | p4 -x - add  # Add all files and directories
p4 submit

echo "Sync complete!"
