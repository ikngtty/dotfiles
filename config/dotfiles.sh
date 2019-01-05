#!/bin/sh
set -eu -o pipefail

# Get util directory's absolute path.
# NOTE: Should do before changing the working directory because
# `$0` returns a relative path.
cd "$(dirname "$0")"  # Directory includes this script.
cd ../                # Project directory.
cd util
util=$(pwd)

# Alias for util.
echo_with_color() {
  "$util/echo_with_color.sh" "$@"
}
err_msg() {
  "$util/err_msg.sh" "$@"
}
print_with_color() {
  "$util/print_with_color.sh" "$@"
}
project_const() {
  "$util/project_const.sh" "$@"
}
project_path() {
  "$util/project_path.sh" "$@"
}

# Import consts.
deploy_status_conflict="$(project_const deploy_status_conflict)"
deploy_status_undeployed="$(project_const deploy_status_undeployed)"
deploy_status_deployed="$(project_const deploy_status_deployed)"

# Usages.
commands() {
  cat <<EOS
Commands:
  check       Check whether each dotfile is deployed or not.
              $(print_with_color yellow "WARNING: Directories where dotfiles are deployed will be created.")
  deploy      Deploy dotfiles.
  help        "help" shows this usage.
              "help <command>" shows an usage for the specified command.

EOS
}

usage() {
  cat <<EOS
Usage: dotfiles.sh <command> [<options>]

EOS
  commands
}

usage_for_check() {
  cat <<EOS
Usage: dotfiles.sh check [-h] [-q <keyword>]

Check whether each dotfile is deployed or not.
$(print_with_color yellow "WARNING: Directories where dotfiles are deployed will be created.")

options:
  -b, --bodyonly  Do not show a header.
  -h, --help      Show this usage.
  -q, --query     Show status of dotfiles related to specified keyword.
                  $(print_with_color magenta "NOTE:") The searching is partial match.
                  If it is not specified, show status of all dotfiles.

EOS
}

usage_for_deploy() {
  cat <<EOS
Usage: dotfiles.sh deploy [-h] [-q <keyword>]

Deploy dotfiles.

options:
  -h, --help      Show this usage.
  -q, --query     Deploy dotfiles related to specified keyword.
                  $(print_with_color magenta "NOTE:") The searching is partial match for status lines,
                  which can be shown by "check" command.
                  If it is not specified, deploy all dotfiles.

EOS
}

# Commands.
check() {
  # Import paths.
  dir_origin_home="$(project_path dir origin_home)"
  dir_deploy_home="$(project_path dir deploy_home)"

  # Check arguments.
  check_pattern=""
  bodyonly=0
  while [ $# -gt 0 ]; do
    case "$1" in
      -h|--help)
        usage_for_check
        exit
        ;;
      -b|--bodyonly)
        bodyonly=1
        ;;
      -q|--query)
        shift
        if [ $# -eq 0 ]; then
          err_msg '"-q" and "--query" should be specified with a keyword.'
          echo
          usage_for_check
          exit 1
        fi
        check_pattern="$1"
        ;;
      -*)
        err_msg "Invalid option \"$1\"."
        echo
        usage_for_check
        exit 1
        ;;
      *)
        err_msg "Invalid argument \"$1\"."
        echo
        usage_for_check
        exit 1
        ;;
    esac
    shift
  done

  # Output a header.
  [ $bodyonly -eq 0 ] && printf "DEPLOY_FROM\tDEPLOY_TO\tSTATUS\n"

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
  while [ $# -gt 0 ]; do
    case "$1" in
      -h|--help)
        usage_for_deploy
        exit
        ;;
      -q|--query)
        shift
        if [ $# -eq 0 ]; then
          err_msg '"-q" and "--query" should be specified with a keyword.'
          echo
          usage_for_deploy
          exit 1
        fi
        pattern_deploy="$1"
        ;;
      -*)
        err_msg "Invalid option \"$1\"."
        echo
        usage_for_deploy
        exit 1
        ;;
      *)
        err_msg "Invalid argument \"$1\"."
        echo
        usage_for_deploy
        exit 1
        ;;
    esac
    shift
  done

  # Deploy.
  check -b -q "$pattern_deploy" |
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

help() {
  if [ $# -eq 0 ]; then
    usage
    exit
  fi

  case "$1" in
    check)
      usage_for_check
      ;;
    deploy)
      usage_for_deploy
      ;;
    help)
      usage
      ;;
    -*)
      err_msg "Invalid option \"$1\"."
      echo
      usage
      exit 1
      ;;
    *)
      err_msg "Invalid command \"$1\"."
      echo
      commands
      exit 1
      ;;
  esac
}

if [ $# -eq 0 ]; then
  err_msg 'Command is required.'
  echo
  usage
  exit 1
fi

case "$1" in
  check)
    shift
    check "$@"
    ;;

  deploy)
    shift
    deploy "$@"
    ;;

  help)
    shift
    help "$@"
    ;;

  -h|--help)
    help
    ;;

  -*)
    err_msg "Invalid option \"$1\"."
    echo
    usage
    exit 1
    ;;

  *)
    err_msg "Invalid command \"$1\"."
    echo
    usage
    exit 1
    ;;
esac
