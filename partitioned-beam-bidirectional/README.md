# Partitioned beam: Bi-directional coupling

This is a bi-directional coupling, in which the left (loaded) participant sends displacements to the right participant and receives back forces.

![preCICE configuration visualization](images/partitioned-beam-bidirectional-precice-config.png)

## How to run

1. Install OpenRadioss and set the `OPENRADIOSS_PATH` in your environment (includes the `starter/` and `engine/` directories)
2. Install the `anim_to_vtk` in `OPENRADIOSS_PATH/exec`
3. Open two terminals and execute the `run.sh` scripts:

   ```sh
   # Terminal 1
   cd beam-left-openradioss
   ./run.sh

   # Terminal 2
   cd beam-right-openradioss
   ./run.sh
   ```

   These scripts rely on the `../tools/setup-openradioss.sh` script.

## State and results

Pending