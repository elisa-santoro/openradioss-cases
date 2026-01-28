#!/usr/bin/env bash
set -e -u

. ../../tools/log.sh
exec > >(tee --append "$LOGFILE") 2>&1

. ../../tools/setup-openradioss.sh

$starter -i beam-left_0000.rad

$engine -i beam-left_0001.rad

$toVTK beam-left

close_log
