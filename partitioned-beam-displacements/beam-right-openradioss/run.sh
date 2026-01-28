#!/usr/bin/env bash
set -e -u

. ../../tools/log.sh
exec > >(tee --append "$LOGFILE") 2>&1

. ../../tools/setup-openradioss.sh

$starter -i beam-right_0000.rad

$engine -i beam-right_0001.rad

$toVTK beam-right

close_log
