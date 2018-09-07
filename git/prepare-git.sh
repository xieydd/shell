#!/bin/bash
git config --global user.name "xieydd"
git config --global user.email xieydd@gmail.com
git config --global merge.tool vimdiff
cat >>~/.git-credentials <<EOF 
https://{xieydd}:{xxx}@github.com
EOF
git config --global credential.helper store
