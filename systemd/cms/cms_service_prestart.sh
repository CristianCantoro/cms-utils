#!/usr/bin/env bash
SOURCED=false && [ "$0" = "$BASH_SOURCE" ] || SOURCED=true

if ! $SOURCED; then
  set -euo pipefail
  IFS=$'\n\t'
fi

source '/usr/share/cms/cms_service_env.sh'

if pgrep "$DAEMON_NAME" >/dev/null; then
    su -c "${SCRIPTSDIR}/kill_cms.sh" cms || true
fi

# cleanup ranking cache
rm -rf /var/local/{lib,cache}/cms/*

# create rundir
mkdir -p "${RUNDIR}/"
touch "${RUNDIR}/cms.pid"

su -c "${SCRIPTSDIR}/start_cms.sh $(cat "$CMS_HOME/contest_id")" cms

while [[ ! -s "${RUNDIR}/cms.pid" ]]; do
  if pgrep "$DAEMON_NAME"; then
    pgrep "$DAEMON_NAME" > "${RUNDIR}/cms.pid"
  fi
done

timestamp="$(date '+%Y-%m-%dT%H:%M:%SZ')"
echo "[$timestamp] CMS daemon Starting" >> "${LOGDIR}/cms.log"

exit 0
