#!/bin/bash

. smoke_test_lib.sh

PYTHON=$(select_python_version)

$PYTHON smoke_test.py
