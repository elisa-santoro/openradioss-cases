#!/usr/bin/env sh
set -e -u

. ../../tools/cleaning-tools.sh

rm -fv solid-openradiossA*
rm -fv solid-openradiossT*
rm -fv *.out
rm -fv *.rst
rm -fv *.vtk

clean_precice_logs .