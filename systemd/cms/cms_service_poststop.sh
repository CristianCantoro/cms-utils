#!/usr/bin/env bash

set -x

source '/usr/share/cms/cms_service_env.sh'

su -c "${SCRIPTSDIR}/kill_cms.sh" cms
rm "${RUNDIR}/cms.pid"

timestamp="$(date '+%Y-%m-%dT%H:%M:%SZ')"
echo "[$timestamp] CMS Stopping" >> "${LOGDIR}/cms.log"

exit 0
