#!/usr/bin/env bash
set -eo pipefail

MESSAGE_SCRIPTS_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)/../message-scripts"
source "${MESSAGE_SCRIPTS_DIR}/messages.sh"

while [[ $# -gt 0 ]];
do
  case "$1" in
    --repo)
      shift 1
      REPO="$1"
      ;;
    --path)
      shift 1
      SUBMODULE_PATH="$1"
      ;;
  esac
  shift 1
done

if [ -z "${SUBMODULE_PATH}" ];
then
  warning "Empty paths are dangerous in use. Use another path instead for submodules installation or update."
  exit 2
fi

if [[ ! -d "${SUBMODULE_PATH}" ]];
then
  warning "Submodule \"${SUBMODULE_PATH}\" is not installed yet."
  exit 1
fi

info "Remove submodule \"${REPO}\""
rm -rf "${SUBMODULE_PATH}"

exit 0
