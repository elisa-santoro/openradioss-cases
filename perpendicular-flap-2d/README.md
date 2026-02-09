Compared to the [perpendicular-2D-flap tutorial](https://precice.org/tutorials-perpendicular-flap) already available for preCICE, the test case presented in this repository implements the following changes:

## preCICE Coupling Set-Up
- The `precice-config-file` has been extended to **generate export files for each participant**: `<export:vtu directory="precice-exports" every-n-time-windows="10" />`.

## Fluid-OpenFOAM Participant
- Simulation time shortened from `t = 5 s` to `t = 0.5 s`.
- Writing interval for VTK output files generation reduced from `writeInterval = 0.1 s` to `writeInterval = 0.05 s`.
   -   This allows for consistency between generation of output files (OpenFOAM solver) as export files (preCICE coupling).
- `system/preciceDict` file changed from `readData Displacement` and `writeData Force` to `readData DISPLACEMENTS` and `writeData FORCES`.
   -   This allows for consistency between data exchanged with OpenRadioss.
   -   This changed required to **rebuild the OpenFOAM adapter** after editing the `FSI/FSI.C` code at the following lines: https://github.com/precice/openfoam-adapter/blob/ea3acb1fdb4870cc432daeb36d479744ae6c9571/FSI/FSI.C#L152.
       - Each instance of `dataName.find("Displacement")` and `dataName.find("Force")` was replaced with `dataName.find("DISPLACEMENTS")` and `dataName.find("FORCES")`.

## Solid-OpenRadioss Participant
- A `0.1 x 1 m` flap geometry has been created and meshed with **4 cells along the X-Direction** and **17 cells along the Y-Direction**.
- A `/PROP/SHELL` card has been defined according to the default OpenRadioss configuration.
