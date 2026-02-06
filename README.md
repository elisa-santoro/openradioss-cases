# Thesis cases for OpenRadioss

This repository contains all the OpenRadioss coupling test cases I have implemented for my master thesis. All coupling cases described below use a **parallel coupling scheme** (to be described in detail in my master thesis). 

Specifically, it is possible to find:

-	`Partitioned-beam-displacements` - **Completed**
    -   Implementation of a `uni-directional coupling`: one structural participant sends **displacements** to the other structure.
    - Two possible variants: `Radioss-Radioss` coupling scenario and `Radioss-OpenFOAM` coupling scenario (with **OpenFOAM writing displacements**).
    - **The case runs well and completes**.
    - Possible to attest that **reading and writing displacements through the OpenRadioss adapter is properly configured**.

- `Partitioned-beam-forces` – **Under investigation**
    - Same _participants_, _physical scenario_ and _boundary conditions_ as `partitioned-beam-displacements`.
    -   Implementation of a `uni-directional coupling`: one structural participant sends **forces** to the other structure.
  - Two possible variants:
    - `Radioss-Radioss` with `time-window-size = 1e-1` - **Case runs well and completes**;
    - `Radioss-Radioss` with `time-window-size = 1e-2` - **Case runs and completes**, however _some instabilities are observed_ (https://github.com/elisa-santoro/openradioss-cases/issues/12).
  - **Reason why of these instabilities - To be further discussed in my thesis**
    - Out-of-syncronization between Radioss solvers (both using an _adaptive time step_) and preCICE.
    - Concept of **subcycling**: for how the coupling Library is configured, preCICE would _only allow one Radioss partecipant to have a smaller time step smaller than the_ `time-window-size`. When both solvers resort to subcycling, the observed instability comes up.
    - More on this matter here: [Subcycling in preCICE](https://precice.org/couple-your-code-waveform) + `preCICE Documentation Manual`.

- `Partitioned-beam-forces-fixedTimeStep` – **To be implemented**
     - Same _participants_, _physical scenario_ and _boundary conditions_ as `partitioned-beam-forces`.
    -   Implementation of a `uni-directional coupling`: one structural participant sends **forces** to the other structure.
  -   Contrary to `partitioned-beam-forces`, both Radioss partecipants now **iterate with a fixed time step**.
    - The idea is to **set a fixed time step** in order to **avoid inducing the de-syncronization oscillations observed here**: https://github.com/elisa-santoro/openradioss-cases/issues/12
  - **To be tested, results will be posted soon**

- `Partitioned-beam-bidirectional` – **To be considered unsuccessfully completed** [For thesis purposes: focus on **why it doesn’t run to the end**]
  - Same _participants_, _physical scenario_ and _boundary conditions_ as `partitioned-beam-forces`.
  - Implementation of a `bi-directional coupling`: one structural participant (`Beam-Left`) **writes displacements** and **reads forces**, the other structure (`Beam-Right`) **writes forces**and **reads displacements**.
  - **For no time-window-size this case runs and completes properly**.
  - This instability is likely due to the **limits OpenRadioss presents as a solver when interfaced with preCICE**:
    - _Explicit dynamics solver with adaptive time step_ – Very likely that throughout the simulation the **solver time step** will be **smaller** than the preCICE `time-window-size`;
    - This would be fine if it were to happen to **only one** of the two coupling partecipants: _concept of subcycling_
  - For this test case, _subcycling happens within both structural partecipants_: not supported by preCICE, hence the crash.

