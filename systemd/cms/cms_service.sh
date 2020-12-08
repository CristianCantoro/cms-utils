#!/usr/bin/env bash
SOURCED=false && [ "$0" = "$BASH_SOURCE" ] || SOURCED=true

if ! $SOURCED; then
  set -euo pipefail
  IFS=$'\n\t'
fi

source '/usr/share/cms/cms_service_env.sh'

wait=0;
while [[ ! -s "${RUNDIR}/cms.pid" ]] && [[ "$wait" -le "$MAIN_WAIT" ]]; do
  sleep 1
  wait=$((wait+1))
done

while kill -0 "$(cat "${RUNDIR}/cms.pid")"; do
  sleep 1
done

exit 1

