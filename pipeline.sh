#!/bin/bash

. pipeline_lib.sh

set -e

./build.sh && run_smoke_tests
