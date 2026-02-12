#!/usr/bin/env bash
set -e -u
shopt -s expand_aliases

. ../tools/log.sh
exec > >(tee --append "$LOGFILE") 2>&1

. ../tools/setup-openradioss.sh

radioss_starter -i partitionedBeam_monolithic_0000.rad

radioss_engine -i partitionedBeam_monolithic_0001.rad

toVTK partitionedBeam_monolithic

close_log
