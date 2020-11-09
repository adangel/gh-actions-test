#!/usr/bin/env bash

mkdir target
cd target

cat > sample-file.txt <<EOF
Test
Test
Test
EOF

zip artifact-bin.zip sample-file.txt
