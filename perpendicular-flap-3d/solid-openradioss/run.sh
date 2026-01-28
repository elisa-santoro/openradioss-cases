#!/usr/bin/env bash
set -e -u

. ../../tools/log.sh
exec > >(tee --append "$LOGFILE") 2>&1

source ./setup.sh

$starter -i solid-openradioss_0000.rad

$engine -i solid-openradioss_0001.rad

$toVTK solid-openradioss

close_log
