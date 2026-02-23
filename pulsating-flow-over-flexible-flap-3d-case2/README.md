# Pulsating Flow over Flexible Flap: 3D FSI Coupling Test Case

This is a variant of the "Pulsating flow over flexible flap" test case discussed in the [OpenFOAM adapter validation paper](https://journal.openfoam.com/index.php/ofj/article/view/88/78) where the `Solid`
participant is modelled in OpenRadioss.

Given the current restrictions presented when interfacing OpenRadioss (an explicit solver) to the preCICE coupling library, the `coupling-scheme` choice implemented in this repository 
fell on a `parallel-explicit` configuration over the `parallel-implicit` scheme implemented in the paper mentioned above. 

![preCICE configuration visualization](images/pulsating-flow-over-flexible-flap-3d-precice-config.png)

## Mesh Configuration

The test case implemented within this repository implements what the [OpenFOAM adapter validation paper](https://journal.openfoam.com/index.php/ofj/article/view/88/78) refer to as `medium` mesh.

This means the `Solid` participant modelled in OpenRadioss is discretized with 384 `HEX20` solid elements, arranged with a 4 x 8 x 12 cell resolution along the three spatial directions.

## How to run

1. Install OpenRadioss and set the `OPENRADIOSS_PATH` in your environment (includes the `starter/` and `engine/` directories)
2. Install the `anim_to_vtk` in `OPENRADIOSS_PATH/exec`
3. Install [OpenFOAM](https://www.openfoam.com/) the [OpenFOAM adapter](https://precice.org/adapter-openfoam-overview.html) (v1.4.0 or later)
3. Open two terminals and execute the `run.sh` scripts:

   ```sh
   # Terminal 1
   cd fluid-openfoam
   ./run.sh

   # Terminal 2
   cd solid-openradioss
   ./run.sh
   ```

   The scripts rely on tools found in `../tools/`.

## State and results

The simulation run for 26 seconds instead of 30 due to storage issues inside my VM. It completes and results are as follows:

#### Simulation setup at `t= 2.5 s`

<img width="1920" height="1080" alt="set-up-2and5secs-1" src="https://github.com/user-attachments/assets/7c00b225-865b-4c23-8ad2-5e392034db22" />
<img width="1920" height="1080" alt="set-up-2and5secs-2" src="https://github.com/user-attachments/assets/cf9b2bcf-2224-4db1-baf3-115bc9dce585" />
<img width="1920" height="1080" alt="set-up-2and5secs-3" src="https://github.com/user-attachments/assets/a817a2db-7c80-4ac0-98f1-0e4ff0406c99" />
<img width="1920" height="1080" alt="set-up-2and5secs-4" src="https://github.com/user-attachments/assets/ca7e787c-74ba-44e8-9799-b35a2ad2bf9f" />
<img width="1920" height="1080" alt="set-up-2and5secs-5" src="https://github.com/user-attachments/assets/fd5c7a3d-1617-46a5-9228-47f6d03f2082" />

#### Cross-section of the computational domain at `z= 0 m` and `t= 2.5s`

<img width="1920" height="1080" alt="cross-section-2and5secs-1" src="https://github.com/user-attachments/assets/996ead57-7986-42ff-bc2a-2c82a570ee6f" />
<img width="1920" height="1080" alt="cross-section-2and5secs-2" src="https://github.com/user-attachments/assets/935c8aed-585f-4881-ba89-d50502be0581" />

#### Cross-section of the computational domain at `z= 0 m`: Temporal Evolution (up to t = 25.5 s)

https://github.com/user-attachments/assets/7f60372a-2f56-4e46-b326-6db85de5b306

#### Watchpoints post-processing

Central WatchPoint

![Watchpoint-Central](https://github.com/user-attachments/assets/416a7328-0ce9-4d68-9852-5909fd88a884)

Left WatchPoint

![Watchpoint-Left](https://github.com/user-attachments/assets/f978e284-27e9-4ef1-8f43-f677bff3336f)
