#!/bin/sh -eu
#####
# WARNING: This script creates directories where it will deploy the files.
#####

# Get project directory's absolute path.
# NOTE: Should do before changing the working directory because
# `$0` returns a relative path.
cd "$(dirname "$0")"
cd ../
dir_project=$(pwd)

# Read the common part.
cd "$dir_project"
. ./__common.sh "$dir_project"

# Output a header.
printf "DEPLOY_FROM\tDEPLOY_TO\n"

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

    printf "$file_origin\t$file_deploy\n"
  done
