#!/bin/bash
project=`fd . '/home/josh/programming' '/home/josh/school/cs' '/home/josh/.config' --min-depth 1 --max-depth 1 --type d | fzf`
cd "$project"
