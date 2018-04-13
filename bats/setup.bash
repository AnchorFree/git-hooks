#!/usr/bin/env bash

function setup {
    TMP_FILE=$(mktemp /tmp/BATS.XXXXXX)
    cp -v $PWD/bats/fixtures/COMMIT_MSG ${TMP_FILE}
    export TEST_BRANCH_NAME=$BATS_TEST_DESCRIPTION
}
