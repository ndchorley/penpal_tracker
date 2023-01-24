#!/bin/bash

dune clean
dune build

cp -r test/expected _build/default/test
cp -r test/penpal_list _build/default/test

dune test
