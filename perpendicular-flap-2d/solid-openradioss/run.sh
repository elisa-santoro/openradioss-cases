#!/usr/bin/env bash
set -e -u
shopt -s expand_aliases

. ../../tools/log.sh
exec > >(tee --append "$LOGFILE") 2>&1

. ../../tools/setup-openradioss.sh

radioss_starter -i solid-openradioss-2d_0000.rad

radioss_engine -i solid-openradioss-2d_0001.rad

toVTK flap2D

close_log
