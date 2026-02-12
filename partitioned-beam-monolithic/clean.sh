#!/usr/bin/env sh
set -e -u

. ../tools/cleaning-tools.sh

clean_openradioss .
rm -fv partitionedBeam_monolithicA* partitionedBeam_monolithicT*