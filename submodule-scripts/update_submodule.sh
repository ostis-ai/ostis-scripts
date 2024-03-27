#!/usr/bin/env bash
set -eo pipefail

SUBMODULE_SCRIPTS_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"

"${SUBMODULE_SCRIPTS_DIR}/remove_submodule.sh" "$@"

case $? in
  0) 
    "${SUBMODULE_SCRIPTS_DIR}/install_submodule.sh" "$@"
    ;;
  1) 
    "${SUBMODULE_SCRIPTS_DIR}/install_submodule.sh" "$@"
    ;;
  2)
    exit 1
    ;;
esac

exit 0
