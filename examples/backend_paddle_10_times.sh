#!/bin/bash

for filename in {"Allen_Cahn","Burgers","diffusion_1d_exactBC","diffusion_1d_resample","diffusion_1d","diffusion_reaction","fractional_diffusion_1d","fractional_Poisson_1d","fractional_Poisson_2d","fractional_Poisson_3d","heat","Helmholtz_Dirichlet_2d","Helmholtz_Neumann_2d_hole","Helmholtz_Sound_hard_ABC_2d","ide","Laplace_disk","Lotka-Volterra","ode_2nd","ode_system","Poisson_Dirichlet_1d_exactBC","Poisson_Dirichlet_1d","Poisson_Lshape","Poisson_multiscale_1d","Poisson_Neumann_1d","Poisson_periodic_1d","Poisson_Robin_1d","Schrodinger","wave_1d"}
do
    if [ -d ../../logs/$filename ]; then
        continue
    else
        mkdir ../../logs/$filename
    fi
    for i in {0,1,2,3,4,5,6,7,8,9}
    do
        echo "$filename $i"
        DDE_BACKEND=paddle python ./pinn_forward/$filename.py > ../../logs/$filename/$i.log
    done
done

for filename in {"brinkman_forchheimer","diffusion_1d_inverse","diffusion_reaction_rate","elliptic_inverse_field","fractional_Poisson_1d_inverse","fractional_Poisson_2d_inverse","Lorenz_inverse_forced","Lorenz_inverse","Navier_Stokes_inverse","reaction_inverse"}
do
    if [ -d ../../logs/$filename ]; then
        continue
    else
        mkdir ../../logs/$filename
    fi
    for i in {0,1,2,3,4,5,6,7,8,9}
    do
        echo "$filename $i"
        DDE_BACKEND=paddle python ./pinn_inverse/$filename.py > ../../logs/$filename/$i.log
    done
done