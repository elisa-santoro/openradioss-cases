# Pulsating Flow over Flexible Flap: 3D FSI Coupling Test Case

This is a variant of the "Pulsating flow over flexible flap" test case discussed in the [OpenFOAM adapter validation paper](https://journal.openfoam.com/index.php/ofj/article/view/88/78) where the `Solid`
participant is modelled in OpenRadioss.

Given the current restrictions presented when interfacing OpenRadioss (an explicit solver) to the preCICE coupling library, the `coupling-scheme` choice implemented in this repository 
fell on a `parallel-explicit` configuration over the `parallel-implicit` scheme implemented in the paper mentioned above. 

![preCICE configuration visualization](images/pulsating-flow-over-flexible-flap-3d-precice-config.png)

## Mesh Configuration

The test case implemented within this repository implements what the [OpenFOAM adapter validation paper](https://journal.openfoam.com/index.php/ofj/article/view/88/78) refer to as `coarse` mesh.

This means the `Solid` participant modelled in OpenRadioss is discretized with 48 `HEX20` solid elements, arranged with a 2 x 4 x 6 cell resolution along the three spatial directions.

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

The simulation completes, and the results are as follows:

#### Simulation setup at `t= 2.5 s`

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/ea869dc8-7fb9-4105-8ecc-40030eb44af3" />
<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/1e6b49c1-e5eb-408d-a1ff-388e10b0fd09" />
<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/70b516be-4fc8-4543-adc0-e03d6be7b8d0" />
<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/05765ddb-397f-4948-b509-b5cb9e7bba01" />

#### Cross-section of the computational domain at `z= 0 m` and `t= 2.5s`

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/8f71975d-092d-402a-a671-c1fbf63c8ce7" />

#### Cross-section of the computational domain at `z= 0 m`: Temporal Evolution

https://github.com/user-attachments/assets/f07708c2-4c6a-442d-a8cd-58d75697b7da

#### Watchpoints post-processing

Central WatchPoint

![watchpoint_Center](https://github.com/user-attachments/assets/35ce629e-a2de-48dd-89bd-9bd8fde84485)
Left WatchPoint

![watchpoint_Left](https://github.com/user-attachments/assets/b760eafb-5b11-47ac-999d-4cb53e3c1cb1)

