#!/bin/bash
mkdir -p ~/bin/ || exit 1
cp bin-cp bin-create bin-fill bin-sha256 ~/bin/ || exit 1
echo "install ok"
