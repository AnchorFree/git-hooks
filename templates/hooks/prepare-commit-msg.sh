#!/bin/bash

# This hook is invoked by git commit right after preparing the default log message, and before the editor is started.
#
# It takes one to three parameters. The first is the name of the file that contains the commit log message. The second
# is the source of the commit message, and can be: message (if a -m or -F option was given); template (if a -t option
# was given or the configuration option commit.template is set); merge (if the commit is a merge or a .git/MERGE_MSG
# file exists); squash (if a .git/SQUASH_MSG file exists); or commit, followed by a commit SHA-1 (if a -c, -C or --amend
# option was given).
#
# If the exit status is non-zero, git commit will abort.
#
# The purpose of the hook is to edit the message file in place, and it is not suppressed by the --no-verify option. A
# non-zero exit means a failure of the hook and aborts the commit. It should not be used as replacement for pre-commit
# hook.

CURRENT_BRANCH_NAME=$(git symbolic-ref --short HEAD)

set -e

BRANCH_NAME=${TEST_BRANCH_NAME:=${CURRENT_BRANCH_NAME}}
MSG=$(head -n 1 $1)

[[ -z "$BRANCH_NAME" ]] && exit 0
if [ "$BRANCH_NAME" = "master" ]; then
	PREPEND="[master] "
elif [[ ${BRANCH_NAME} =~ ^build_ ]]; then
	PREPEND="[build] "
elif [[ ${BRANCH_NAME} =~ ^v ]]; then
	PREPEND="[build] "
else
	TICKET=`echo "$BRANCH_NAME" | grep -m 1 -oE '\w+-[0-9]+' | head -n1`
	[ -z "$TICKET" -o "$TICKET" = "$BRANCH_NAME" ] && exit 0
	PREPEND="[$TICKET] "
fi

[[ "${MSG:0:${#PREPEND}}" == "$PREPEND" ]] && exit 0

sed -i.bak -e "1s/^/${PREPEND}/" $1

cat $1
