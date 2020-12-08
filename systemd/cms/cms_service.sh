#!/usr/bin/env bash
SOURCED=false && [ "$0" = "$BASH_SOURCE" ] || SOURCED=true

if ! $SOURCED; then
  set -euo pipefail
  IFS=$'\n\t'
fi

source '/usr/share/cms/cms_service_env.sh'

sleep "${MAIN_WAIT}"
while kill -0 "$(cat "${RUNDIR}/cms.pid")"; do
    sleep 1
done

exit 1

