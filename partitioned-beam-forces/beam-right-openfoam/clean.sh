#!/bin/bash

# Ensure script stops if any command fails
set -e

# Remove all directories/files starting with a number. 
# This removes 0 (if created by restore0dir) and all solution time steps (0.001, 1, 10, etc.)
echo "Removing generated time step directories..."
rm -rf $(ls -d [0-9]* | grep -v '^0\.orig$') # Except 0.orig

# Note: If you specifically only want to target files starting with 0. 
# and not integer-named folders like '1' or '10', you could use:
# rm -rf 0.[0-9]*
# However, [0-9]* is the standard, safest way to clean up all solution times.

echo "Removing generated output VTK files..."
rm -r VTK

echo "Removing precice related folders..."
rm -r precice-exports
rm -r precice-profiling