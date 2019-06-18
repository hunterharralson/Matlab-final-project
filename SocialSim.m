function SocialSim
rng('shuffle');
% make a neighborhood 
n = makeNeighborhood(6,6,9,0.35);

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