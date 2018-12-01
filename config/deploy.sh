#!/bin/sh
set -eu -o pipefail

#####
# Arguments
# $1: A pattern for deploy file's path. Default value is "".
#####
pattern_deploy=""
[ $# -eq 1 ] && pattern_deploy=$1

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
$sh_check_deploy_status     |
  tail -n +2                | # Remove the header
    grep "$pattern_deploy"  |
      while IFS="$(printf "\t")" read deploy_from deploy_to deploy_status
      do
        case "$deploy_status" in
          *UNDEPLOYED*)
            printf "\e[32m"
            printf "Deploying "
            printf "\e[1m$(basename "$deploy_from")\e[m"
            printf "\e[32m"
            printf "... "
            ln -s "$deploy_from" "$(dirname "$deploy_to")"
            printf "Done!"
            printf "\e[m\n"
            ;;
          *CONFLICT*)
            printf "\e[33m"
            printf "WARNING: Failed to deploy "
            printf "\e[1m$(basename "$deploy_from")\e[m "
            printf "\e[33m"
            printf "because it conflicts. Please check and resolve it."
            printf "\e[m\n"
            ;;
        esac
      done
