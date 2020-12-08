#!/usr/bin/env bash

source '/usr/share/cms/cms_service_env.sh'

sleep "${MAIN_WAIT}"
while kill -0 "$(cat "${RUNDIR}/cms.pid")"; do
    sleep 1
done

exit 1

