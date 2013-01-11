#!/bin/bash

# Config
PERFORCE_ROOT=/home/httpd/dev/perforce

GIT_DIR=${PWD}
REPO_NAME=${PWD##*/}
PERFORCE_DIR=$PERFORCE_ROOT/$REPO_NAME

cd $PERFORCE_DIR
p4 delete ...  # Recursive delete
p4 submit -d "Removed old files before git sync (automated)"

cd $GIT_DIR
cp -ar * $PERFORCE_DIR/
cd $PERFORCE_DIR
find . -type f -print | p4 -x - add  # Add all files and directories
p4 submit -d "Check-in latest from git (automated)"
