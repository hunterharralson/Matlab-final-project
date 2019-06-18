function SocialSim
% Runs a base simulation of a neighborhood with 36 individuals, 2 of which are short-fused, and with half of the people randomly assigned to be hostile 
% The simulation is then displayed as the neighborhood evolves over 14 days

rng('shuffle');
% make a neighborhood 
n = makeNeighborhood(6,6,2,0.5);

% evolve the neighborhood for 14 days and display each day:
figure;
subplot(4,4,1);
displayNeighborhood(n,1);
title('Day 1');
for days = 2:14
    n = evolveNeighborhood(n);
    subplot(4,4,days);
    displayNeighborhood(n,1);
    title(['Day ' num2str(days)]);
end
end
