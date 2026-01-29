# Partitioned beam: Uni-directional coupling (forces)

This is a uni-directional coupling, in which the left (loaded) participant sends forces to the right participant.

![preCICE configuration visualization](images/partitioned-beam-forces-precice-config.png)

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

TODO