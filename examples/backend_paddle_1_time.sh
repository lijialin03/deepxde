#!/bin/bash

original_dir=$(pwd)

if [ -d ../logs ]; then
    continue
else
    mkdir ../logs
fi

cd ./function
for filename in {"dataset","func"}
do
    echo "Case: $filename"
    PRIM=1 DDE_BACKEND=paddle python ./$filename.py > ../../logs/$filename.log
done
cd "$original_dir"

cd ./operator
# for filename in {"advection_aligned_pideeponet_2d","advection_aligned_pideeponet","advection_unaligned_pideeponet_2d","advection_unaligned_pideeponet","antiderivative_aligned_pideeponet","antiderivative_aligned","antiderivative_unaligned_pideeponet","diff_rec_aligned_pideeponet","diff_rec_aligned_zcs_pideeponet","diff_rec_unaligned_pideeponet","poisson_1d_pideeponet","stokes_aligned_zcs_pideeponet"}
for filename in {"antiderivative_aligned","antiderivative_unaligned_pideeponet","antiderivative_unaligned","diff_rec_aligned_zcs_pideeponet","poisson_1d_pideeponet"}
do
    echo "Case: $filename"
    PRIM=1 DDE_BACKEND=paddle python ./$filename.py > ../../logs/$filename.log
done
cd "$original_dir"

cd ./pinn_forward
# for filename in {"Allen_Cahn","Burgers_RAR","Burgers","diffusion_1d_exactBC","diffusion_1d_resample","diffusion_1d","diffusion_reaction","elasticity_plate","Euler_beam","fractional_diffusion_1d","fractional_Poisson_1d","fractional_Poisson_2d","fractional_Poisson_3d","heat_resample","heat","Helmholtz_Dirichlet_2d","Helmholtz_Dirichlet_2d_HPO","Helmholtz_Neumann_2d_hole","Helmholtz_Sound_hard_ABC_2d","ide","Klein_Gordon","Kovasznay_flow","Laplace_disk","Lotka_Volterra","ode_2nd","ode_system","Poisson_Dirichlet_1d_exactBC","Poisson_Dirichlet_1d","Poisson_Lshape","Poisson_multiscale_1d","Poisson_Neumann_1d","Poisson_periodic_1d","Poisson_Robin_1d","Volterra_IDE","Schrodinger","wave_1d"}
for filename in {"Burgers_RAR","Burgers","diffusion_1d_exactBC","diffusion_1d_resample","diffusion_1d","diffusion_reaction","elasticity_plate","Euler_beam","fractional_diffusion_1d","fractional_Poisson_1d","fractional_Poisson_2d","heat","Helmholtz_Dirichlet_2d","Helmholtz_Neumann_2d_hole","Helmholtz_Sound_hard_ABC_2d","ide","Klein_Gordon","Kovasznay_flow","Laplace_disk","Lotka_Volterra","ode_2nd","ode_system","Poisson_Dirichlet_1d_exactBC","Poisson_Dirichlet_1d","Poisson_Lshape","Poisson_multiscale_1d","Poisson_Neumann_1d","Poisson_periodic_1d","Poisson_Robin_1d","Volterra_IDE","Schrodinger","wave_1d"}
do
    echo "Case: $filename"
    PRIM=1 DDE_BACKEND=paddle python ./$filename.py > ../../logs/$filename.log
done
cd "$original_dir"

cd ./pinn_inverse
# for filename in {"brinkman_forchheimer","diffusion_1d_inverse","diffusion_reaction_rate","elliptic_inverse_field_batch","elliptic_inverse_field","fractional_Poisson_1d_inverse","fractional_Poisson_2d_inverse","Lorenz_inverse_forced","Lorenz_inverse","Navier_Stokes_inverse","reaction_inverse"}
for filename in {"brinkman_forchheimer","diffusion_1d_inverse","diffusion_reaction_rate","elliptic_inverse_field_batch","elliptic_inverse_field","fractional_Poisson_1d_inverse","Lorenz_inverse_forced","Lorenz_inverse","Navier_Stokes_inverse"}
do
    echo "Case: $filename"
    PRIM=1 DDE_BACKEND=paddle python ./$filename.py > ../../logs/$filename.log
done
cd "$original_dir"