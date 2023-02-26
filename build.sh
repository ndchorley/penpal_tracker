#!/bin/bash

. build_lib.sh

BUILD_COMMIT_HASH=$1

generate_version_module $BUILD_COMMIT_HASH

dune clean
dune build

cp -r test/expected _build/default/test
cp -r test/penpal_list _build/default/test

dune test
