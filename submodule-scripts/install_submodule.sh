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
    --branch)
      shift 1
      BRANCH="$1"
      ;;
    --commit)
      shift 1
      COMMIT="$1"
      ;;
  esac
  shift 1
done

if [ -z "${SUBMODULE_PATH}" ];
then
  warning "Empty paths are dangerous in use. Use another path instead for submodules installation."
  exit 2
fi

if [[ -d "${SUBMODULE_PATH}" ]];
then
  warning "Submodule \"${SUBMODULE_PATH}\" is already installed."
  exit 1
fi

info "Clone submodule \"${REPO}\" (\"${BRANCH}\") into \"${SUBMODULE_PATH}\""
git clone "${REPO}" --branch "${BRANCH}" --single-branch "${SUBMODULE_PATH}" --recursive
if [ -n "${COMMIT}" ];
then
  cd "${SUBMODULE_PATH}" && git checkout "${COMMIT}"
fi

exit 0
