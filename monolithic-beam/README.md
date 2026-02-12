# Partitioned beam: Monolithic Case

This is the monolithic test case implementation used to validate the `partitioned-beam-bidirectional` coupling problem. In this set-up, a portion of the monolithic beam is uniformly loaded and causes displacement to occour within the entire structure.

## How to run

1. Install OpenRadioss and set the `OPENRADIOSS_PATH` in your environment (includes the `starter/` and `engine/` directories)
2. Install the `anim_to_vtk` in `OPENRADIOSS_PATH/exec`
3. Open one terminal and execute the `run.sh` script:

   ```sh
   # Terminal 1
   cd monolithic-beam
   ./run.sh

   This script relies on the `../tools/setup-openradioss.sh` script.

## State and results

The simulation completes, and the results are as follows:

<img width="3840" height="2160" alt="0_monolithic" src="https://github.com/user-attachments/assets/1d39c187-562d-4f72-ba90-4df98f5db3aa" />
<img width="3840" height="2160" alt="Screenshot (55)" src="https://github.com/user-attachments/assets/d8e74802-b6a2-40b5-87e8-fe54c71dbd21" />
