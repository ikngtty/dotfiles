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
$sh_check_deploy_status "$pattern_deploy"   |
  tail -n +2                                | # Remove the header
    while IFS="$(printf "\t")" read deploy_from deploy_to deploy_status
    do
      file_name=$(basename "$deploy_from")
      case "$deploy_status" in
        "$deploy_status_undeployed")
          print_with_color green "Deploying <b>$file_name</b> ..."
          ln -s "$deploy_from" "$(dirname "$deploy_to")"
          echo_with_color green ' Done!'
          ;;
        "$deploy_status_conflict")
          echo_with_color yellow 'WARNING: Failed to deploy'\
            " <b>$file_name</b> because it conflicts."\
            ' Please check and resolve it.'
          ;;
        "$deploy_status_deployed")
          echo_with_color magenta "<b>$file_name</b> is already deployed."
          ;;
      esac
    done
