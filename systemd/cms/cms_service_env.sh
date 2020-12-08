#!/usr/bin/env bash
DAEMON_NAME="cmsResourceServ"
CMS_HOME='/home/cms'
RUNDIR='/var/run/cms'
LOGDIR='/var/log/cms'
SCRIPTSDIR="$CMS_HOME/.scripts"
PRESTART_NRETRIES=10
PRESTART_WAIT_RETRY=0.5
MAIN_WAIT=5
