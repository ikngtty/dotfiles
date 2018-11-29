#!/bin/sh
set -eu -o pipefail

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
    while IFS="$(printf "\t")" read deploy_from deploy_to deploy_status
    do
      case "$deploy_status" in
        "UNDEPLOYED")
          printf "Deploying $(basename "$deploy_from") ... "
          ln -s "$deploy_from" "$(dirname "$deploy_to")"
          echo "Done!"
          ;;
        "CONFLICT")
          echo "[WARNING] Failed to deploy $(basename "$deploy_from")"\
            "because it conflicts. Please check and resolve it."
          ;;
      esac
    done
