#!/usr/bin/env bats

load setup
load teardown

@test "v1.0.0" {
    ${PWD}/templates/hooks/prepare-commit-msg ${TMP_FILE}
    grep '^\[build\] ' ${TMP_FILE}
}

@test "master" {
    ${PWD}/templates/hooks/prepare-commit-msg ${TMP_FILE}
    grep '^\[master\] ' ${TMP_FILE}
}

@test "build_100500" {
    ${PWD}/templates/hooks/prepare-commit-msg ${TMP_FILE}
    grep '^\[build\] ' ${TMP_FILE}
}

@test "BRANCH BFG-9000-DEPLOYMENT-TIME" {
    ${PWD}/templates/hooks/prepare-commit-msg ${TMP_FILE}
    grep '^\[BFG-9000\] ' ${TMP_FILE}
}
