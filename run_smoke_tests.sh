#!/bin/bash

. smoke_test_lib.sh

PYTHON=$(select_python_version)

BUILD_COMMIT_HASH=$1 $PYTHON smoke_test.py
