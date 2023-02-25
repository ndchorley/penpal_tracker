#!/bin/bash

. pipeline_lib.sh

run_stage_and_exit_on_failure "build" ./build.sh
run_stage_and_exit_on_failure "smoke tests" run_smoke_tests
