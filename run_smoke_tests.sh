#!/bin/bash

PYTHON="python3"

function select_python_version() {
    local OS=$(uname)

    if [ "$OS" = "Linux" ];
    then
        PYTHON="python3.10"
    fi
}


select_python_version

$PYTHON smoke_test.py
