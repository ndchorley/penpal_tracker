#!/bin/bash

set -e

./build.sh

OS=$(uname)

PYTHON="python3"

if [ "$OS" = "Linux" ];
then
    PYTHON="python3.10"
fi

$PYTHON smoke_test.py
