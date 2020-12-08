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
sleep 5
pgrep "$DAEMON_NAME" > "${RUNDIR}/cms.pid"

timestamp="$(date '+%Y-%m-%dT%H:%M:%SZ')"
echo "[$timestamp] CMS daemon Starting" >> "${LOGDIR}/cms.log"

exit 0
