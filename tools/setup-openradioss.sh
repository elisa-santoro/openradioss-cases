#!/bin/bash
shopt -s expand_aliases

# Set OPENRADIOSS_PATH in your ~/.bashrc, or uncomment the next line
# export OPENRADIOSS_PATH="/home/testuser/OpenRadioss"
export RAD_CFG_PATH=$OPENRADIOSS_PATH/hm_cfg_files
export OMP_STACKSIZE=400m
export LD_LIBRARY_PATH="$OPENRADIOSS_PATH/extlib/hm_reader/linux64/:$OPENRADIOSS_PATH/extlib/h3d/lib/linux64/:$LD_LIBRARY_PATH"

alias radioss_starter='$OPENRADIOSS_PATH/starter/cbuild_starter_linux64_gf/starter_linux64_gf'
alias radioss_engine='$OPENRADIOSS_PATH/engine/cbuild_engine_linux64_gf_ompi_precice/engine_linux64_gf_ompi_precice'
alias radiossVTK='$OPENRADIOSS_PATH/exec/anim_to_vtk_linux64_gf'
alias radiossCSV='$OPENRADIOSS_PATH/exec/th_to_csv_linux64_gf'

# Run `toVTK modelA` to convert all animation files modelAA* to VTK format
toVTK() {

    if [ $# -lt 1 ]; then
        echo "ERROR - Usage: toVTK ROOTNAME"
        return 1
    fi

    Rootname="$1"

    for file in "${Rootname}"A*; do
        # skip if no matching files
        [ -e "$file" ] || { echo "ERROR: No files matching ${Rootname}A*"; return 1; }

        animation_number="${file#"${Rootname}A"}"

        radiossVTK "$file" > "${Rootname}_${animation_number}.vtk"

        echo "Converted ${Rootname}A${animation_number} → ${Rootname}_${animation_number}.vtk"
    done
}

# Run `toCSV modelA` to convert all animation files modelAA* to CSV format
toCSV() {

    if [ $# -lt 1 ]; then
        echo "ERROR - Usage: toVTK ROOTNAME"
        return 1
    fi

    Rootname="$1"

    for file in "${Rootname}"T*; do
        # skip if no matching files
        [ -e "$file" ] || { echo "ERROR: No files matching ${Rootname}T*"; return 1; }

        history_number="${file#"${Rootname}T"}"

        radiossCSV "$file" > "${Rootname}_${history_number}.csv"

        echo "Converted ${Rootname}T${history_number} → ${Rootname}_${history_number}.csv"
    done
}

