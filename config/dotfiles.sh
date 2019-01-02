#!/bin/sh
set -eu -o pipefail

# Get project directory's absolute path.
# NOTE: Should do before changing the working directory because
# `$0` returns a relative path.
cd "$(dirname "$0")"
# dir_here=$(pwd)
cd ../
dir_project=$(pwd)

# Read the common part.
cd "$dir_project"
# shellcheck source=../__common.sh
. ./__common.sh "$dir_project"

usage() {
  cat <<EOS
Usage: dotfiles.sh [-h|--help] <command> [<args>]

Commands are:
  check     Check whether each dotfile is deployed or not.
            $(print_with_color yellow "WARNING: Directories where dotfiles are deployed will be created.")
            arg1: text to search (using partial match)
                  If specified, show only hit lines.

  deploy    Deploy dotfiles.
            arg1: text to specify dotfiles (using partial match)
                  If specified, deploy only files in hit lines which are output
                  by 'check' command.

  help      Show this usage.
EOS
}

check() {
  # Check arguments.
  check_pattern=""
  [ $# -eq 1 ] && check_pattern=$1

  # Output a header.
  printf "DEPLOY_FROM\tDEPLOY_TO\tSTATUS\n"

  # List the file paths.
  {
    cd "$dir_origin_home"
    find . -type f -exec printf "{}\t$dir_origin_home\t$dir_deploy_home\n" \;
    # NOTE: Suppose to add other directories' files in the same way.
  } |
    while IFS="$(printf "\t")" read relative_path\
                                    dir_origin_file_from\
                                    dir_deploy_file_from
    do
      relative_dir=$(dirname "$relative_path")
      file_name=$(basename "$relative_path")

      # Get a path of an original file.
      cd "$dir_origin_file_from"
      cd "$relative_dir"
      file_origin=$(pwd)/$file_name

      # Get a path to deploy.
      cd "$dir_deploy_file_from"
      mkdir -p "$relative_dir"
      cd "$relative_dir"
      file_deploy=$(pwd)/$file_name

      # Check a deployment status.
      deploy_status="$deploy_status_conflict"
      if [ ! -e "$file_deploy" ]; then
        deploy_status="$deploy_status_undeployed"
      elif [ "$(readlink "$file_deploy")" = "$file_origin" ]; then
        deploy_status="$deploy_status_deployed"
      fi

      printf "$file_origin\t$file_deploy\t$deploy_status\n"
    done                      |
    grep -F "$check_pattern"  |
    grep -Fv ".DS_Store"
}

deploy() {
  # Check arguments.
  pattern_deploy=""
  [ $# -eq 1 ] && pattern_deploy=$1

  # Deploy.
  check "$pattern_deploy"   |
    tail -n +2              | # Remove the header
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
}

case "$1" in
  check)
    shift
    check "$@"
    ;;

  deploy)
    shift
    deploy "$@"
    ;;

  help|-h|--help)
    usage
    ;;

  *)
    err_msg "Invalid command '$1'"
    echo
    usage
    exit 1
    ;;
esac
