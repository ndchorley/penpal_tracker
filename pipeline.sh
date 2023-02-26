#!/bin/bash

. pipeline_lib.sh

BUILD_COMMIT_HASH=$(latest_commit_hash)

run_stage_and_exit_on_failure \
    "build" "./build.sh $BUILD_COMMIT_HASH"

run_stage_and_exit_on_failure \
    "smoke tests" "./run_smoke_tests.sh $BUILD_COMMIT_HASH"

run_stage_and_exit_on_failure "install" ./install.sh
