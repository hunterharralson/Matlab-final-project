# dynamic-evolutionary
A MATLAB reproduction from Kendrick, Li, and Butner's 2003 Social dynamical evolutionary psychology experiment. 
    (Dynamical Evolutionary Psychology: Individual Decision Rules and Emergent Social Norms)

In this simulation, we are interested in the way that hostile individuals in a neighborhood can negatively affect their neighbors.
Furthermore, we are interested in the way that peaceful individuals can positively affect their neighbors.
An added element, number of short-fused individuals, can also affect the neighborhood negatively. 

The basic simulation (SocialSim) represents a 6x6 neighborhood of 36 individuals, in which 50% of them start off as hostile and 2 short-fused. 
The neighborhood evolves each day, as each individual in the neighborhood has his/her attitude evolve based on the attitudes of his/her neighbors.
If the individual has proportionally more hostile neighbors than peaceful neighbors, then on the next day that individual will also be hostile.
However, if the individual has more peaceful than hostile neighbors, that indivual will be peaceful on the next day of the evolution.
For the short-fused element, any individual can start off as short-fused whether peaceful or hostile, and they remain short-fused for the entire evolution.
If an individual is short-fused, it only takes one hostile neighbor for the short-fused individual to evolve to hostile the next day. 

The KLB_fig5 represents three graphs that show how both proportion of hostile individuals and number of short-fused individuals affect the final proportion of hostile individuals in a 6x6 neighborhood that has evolved. 
As proportion of hostile individuals increases from 0 to 1, increasing by 0.03 each time, 10 simulations are run for each increment, for a total of 1020 simulations per graph.
Each simulation is a 14 day evolution similar to the one from SocialSim.
Each graph varies by number of short-fused individuals in the neighborhood (0, 9, or 18).
