#!/bin/bash

# shellcheck disable=SC2012
newest_file=$(ls -t out| head -1)

run_archiso "-i$HOME/RefinedArch/out/$newest_file" >/dev/null 2>&1 &

wait $!
