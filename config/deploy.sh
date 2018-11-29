#!/bin/sh -eu

# Get project directory's absolute path.
# NOTE: Should do before changing the working directory because
# `$0` returns a relative path.
cd "$(dirname "$0")"
dir_here=$(pwd)
cd ../
dir_project=$(pwd)

# Read the common part.
cd "$dir_project"
. ./__common.sh "$dir_project"

# Deploy.
cd "$dir_here"
./check_deploy_status.sh    |
  tail -n +2                | # Remove the header
    while IFS="$(printf "\t")" read deploy_from deploy_to
    do
      ln -s "$deploy_from" "$(dirname "$deploy_to")"
    done
