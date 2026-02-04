#!/bin/sh
cd "${0%/*}" || exit                                # Run from this directory
. ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions        # Tutorial run functions
#------------------------------------------------------------------------------

# Set up error checking - exit immediately if any command fails
# The 'set -e' command is crucial for robust simulation scripts.
set -e

# Clear any previous log files before starting
echo "Cleaning up previous simulation logs..."
rm -f log.*

# --- Simulation Setup Steps ---

## 1. restore0dir
# Copies/links the initial fields from a setup directory (often '0.orig') to '0'.
echo "Restoring initial time step directory '0'..."
restore0Dir

## 2. blockMesh
# Generates the computational mesh based on the 'blockMeshDict' file.
echo "Generating the mesh with blockMesh..."
blockMesh | tee log.blockMesh

# --- Simulation Run ---

## 4. simpleDisplacementFoam
# Runs the main solver.
echo "Running the solver simpleDisplacementFoam..."
solidDisplacementFoam | tee log.simpleDisplacementFoam

## 5. VTK files generation

foamToVTK