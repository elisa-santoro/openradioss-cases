# Partitioned beam: Structural Participant modelled in OpenFOAM

In this repository it is possible to find a variant for the case presented [here](https://github.com/elisa-santoro/openradioss-cases/tree/master/partitioned-beam-forces#readme) 
where the `Beam-Right` participant is modelled in OpenFOAM.

Specifically, the OpenFOAM solver used for this purpose is `solidDisplacementFoam`, and to evaluate the force field written by the Radioss solver (`Beam-Left` participant) to the OpenFOAM `interface` the 
corresponding patch has been labeled as `type solidDisplacementFoamForce` in the `0/D` folder. 

This label is a `custom patchField type` originally defined to model in OpenFOAM the solid flap presented in this [preCICE tutorial](https://precice.org/tutorials-perpendicular-flap).
The `solidDisplacementFoamForce` directory has therefore been copied from [here](https://github.com/precice/tutorials/tree/develop/perpendicular-flap/solid-openfoam/solidDisplacementFoamForce) and pasted
within the `beam-right-openfoam` directory.
