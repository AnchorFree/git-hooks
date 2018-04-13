#!/usr/bin/env bash

set -e
set -x

git config --global init.templateDir "${PWD}/templates"

find $1 -name .git -type d 2>/dev/null | xargs -n1 -I {} cp -v ./templates/hooks/* {}/hooks
