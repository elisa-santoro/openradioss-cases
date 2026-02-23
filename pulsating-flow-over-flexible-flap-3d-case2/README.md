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

The simulation has been run for 26 seconds instead of 30 due to storage issues inside my VM. It completes and results are as follows:

#### Simulation setup at `t= 2.5 s`

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/94ea7177-d637-40b1-9f21-a4161e6bb914" />
<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/049ac2f8-1435-4620-b441-16a1ce2b1d57" />
<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/a9a86bde-ea87-41a8-aa98-eb95e6c44bf4" />
<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/328811c5-1d54-491d-ab64-035e62aae7c4" />

#### Cross-section of the computational domain at `z= 0 m` and `t= 2.5s`

<img width="1920" height="1080" alt="Screenshot (584)" src="https://github.com/user-attachments/assets/50f25b52-354c-4ea5-bcb3-0ed043435ac5" />
<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/4206fda9-e9a0-46bd-9859-0969799dc6a1" />

#### Cross-section of the computational domain at `z= 0 m`: Temporal Evolution

https://github.com/user-attachments/assets/08be254f-628c-4f2d-b445-bbc85d012320

#### Watchpoints post-processing

Central WatchPoint

![Watchpoint-Central](https://github.com/user-attachments/assets/8a68ca97-4c6e-4155-bb68-565d4ac86c0d)

Left WatchPoint

![Watchpoint-Left](https://github.com/user-attachments/assets/3d2b4b77-860b-4dc6-9134-f4cd80e6ba45)



