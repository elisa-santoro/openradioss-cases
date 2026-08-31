# Partitioned beam: Monolithic Case

This is the monolithic test case implementation used to validate the [partitioned-beam-bidirectional](https://github.com/elisa-santoro/openradioss-cases/tree/master/partitioned-beam-bidirectional) coupling problem. In this set-up, a portion of the upper surface of the monolithic beam is uniformly loaded with a pressure set equal to $p = 1.828.570$ Pa along the negative Y-Direction. 

Such load is applied to a rectangular area equal to `upper-surface-loaded` = (2 x 0.5) $m^2$, for $6 \le Z \le 8$ m, and causes displacement to occour within the entire structure. 

The simulation has been analytically validated by computing the reaction force registerred at each fixed end of the monolithic beam and comparing such values to the ones expected by analytical formulas available in structural mechanics tables. 

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

##### Reaction Force computed for Z = 0 m
![valitation-Z0](https://github.com/user-attachments/assets/9bad3098-0852-43b3-8034-95099eecb97c)

##### Reaction Force computed for Z = 8 m
![valitation-Z8](https://github.com/user-attachments/assets/a0ac1362-8bb4-4647-9698-849e82f4ad47)


