#!/usr/bin/env bash
SOURCED=false && [ "$0" = "$BASH_SOURCE" ] || SOURCED=true

if ! $SOURCED; then
  set -euo pipefail
  IFS=$'\n\t'
fi

source '/usr/share/cms/cms_service_env.sh'

su -c "${SCRIPTSDIR}/kill_cms.sh" cms
rm -f "${RUNDIR}/cms.pid"

timestamp="$(date '+%Y-%m-%dT%H:%M:%SZ')"
echo "[$timestamp] CMS Stopping" >> "${LOGDIR}/cms.log"

exit 0
