#!/bin/bash

set -e

while getopts 'u:' flag; do
    case $flag in
	u) url=$OPTARG ;;
    esac
done

hook_url=${url:-'https://raw.githubusercontent.com/anl/chef-hooks/master/pre-commit'}

# Get top level of repo, and set path to pre-commit hook:
top_level=$(git rev-parse --show-toplevel)
pc_hook=${top_level}/.git/hooks/pre-commit

rm -f $pc_hook
curl -o - $hook_url > $pc_hook
chmod 755 $pc_hook

