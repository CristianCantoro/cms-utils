#!/usr/bin/env bash

set -x

source '/usr/share/cms/cms_service_env.sh'

if pgrep "$DAEMON_NAME" >/dev/null; then
    su -c "${SCRIPTSDIR}/kill_cms.sh" cms
fi

# cleanup ranking cache
rm -rf /var/local/cache/cms/*

# create rundir
mkdir -p "${RUNDIR}/"

su -c "${SCRIPTSDIR}/start_cms.sh $(cat "$CMS_HOME/contest_id")" cms

i=1
while [[ "$i" -le "$PRESTART_NRETRIES" ]] && [[ ! -s "${RUNDIR}/cms.pid" ]]; do
  pgrep "$DAEMON_NAME" > "${RUNDIR}/cms.pid" || true
  sleep "$PRESTART_WAIT_RETRY"
  i=$((i+1))
done

timestamp="$(date '+%Y-%m-%dT%H:%M:%SZ')"
echo "[$timestamp] CMS daemon Starting" >> "${LOGDIR}/cms.log"

exit 0
