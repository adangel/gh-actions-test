#!/usr/bin/env bash

mkdir target
cd target

cat > sample-file.txt <<EOF
Test
Test
Test
EOF

if [ -x "$(command -v zip)" ]; then
    zip artifact-bin.zip sample-file.txt
fi
