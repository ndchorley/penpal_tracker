#!/bin/bash

. pipeline_lib.sh

export BUILD_COMMIT_HASH=$(latest_commit_hash)

run_stage_and_exit_on_failure "build" ./build.sh
run_stage_and_exit_on_failure "smoke tests" ./run_smoke_tests.sh
run_stage_and_exit_on_failure "install" ./install.sh
